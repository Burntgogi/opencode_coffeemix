#Requires -Version 5.1
<#
.SYNOPSIS
    Install coffeemix_all 0.2 assets into the global OpenCode configuration directory.

.DESCRIPTION
    Copies gb-* specialist agents, skills, plugins, and configuration files
    from the coffeemix_all 0.2 package into %USERPROFILE%\.config\opencode\.

    Model mapping modes (in priority order):
      1. Auto-detect: Reads existing oh-my-opencode.json model mappings
         and applies them to new gb-* agents.
      2. Provider scan: Reads opencode.json provider section to build
         model assignments based on provider names.
      3. Placeholder: Uses YOUR_PROVIDER/YOUR_MODEL for manual setup.

    By default, this script performs an additive merge and skips existing files.
    With -UpdateCoffeeMix, it refreshes only CoffeeMix-owned package assets
    after backing them up.

.PARAMETER PackageDir
    Path to the coffeemix_all package directory.
    Defaults to the script's parent directory.

.PARAMETER WhatIf
    Preview what would be copied without making changes.

.PARAMETER UpdateCoffeeMix
    Refresh existing CoffeeMix-owned package assets after backing them up.
    Only gb-* agents, package skill directories, and package plugin files are
    updated. User/provider/global configuration remains merge-or-skip only.

.PARAMETER BackupDir
    Directory for backups created by -UpdateCoffeeMix.
    Defaults to <ConfigDir>\.coffeemix-backups\<timestamp>.

.PARAMETER PlaceholderOnly
    Skip model auto-detection and use YOUR_PROVIDER/YOUR_MODEL for all agents.

.PARAMETER ConfigDir
    Target OpenCode configuration directory.
    Defaults to %USERPROFILE%\.config\opencode.
    Use this with -WhatIf for safe mock validation.

.EXAMPLE
    .\install-global.ps1
    .\install-global.ps1 -PackageDir "C:\path\to\opencode_coffeemix_all_0_2"
    .\install-global.ps1 -WhatIf
    .\install-global.ps1 -UpdateCoffeeMix
    .\install-global.ps1 -UpdateCoffeeMix -BackupDir "C:\temp\coffeemix-backup"
    .\install-global.ps1 -PlaceholderOnly
    .\install-global.ps1 -WhatIf -ConfigDir "C:\temp\mock-opencode-config"
#>

param(
    [string]$PackageDir = $PSScriptRoot,
    [switch]$WhatIf,
    [switch]$UpdateCoffeeMix,
    [string]$BackupDir = "",
    [switch]$PlaceholderOnly,
    [string]$ConfigDir = ""
)

$ErrorActionPreference = "Stop"

# ── Colors ──────────────────────────────────────────────────────────
function Write-OK   { param($m) Write-Host "  ✓ " -NoNewline -ForegroundColor Green; Write-Host $m }
function Write-SKIP { param($m) Write-Host "  ⊘ " -NoNewline -ForegroundColor Yellow; Write-Host $m }
function Write-ERR  { param($m) Write-Host "  ✗ " -NoNewline -ForegroundColor Red; Write-Host $m }
function Write-INFO { param($m) Write-Host "  ℹ " -NoNewline -ForegroundColor Cyan; Write-Host $m }
function Write-HDR  { param($m) Write-Host "`n► $m" -ForegroundColor Cyan }

# ── Resolve paths ───────────────────────────────────────────────────
if ([string]::IsNullOrWhiteSpace($ConfigDir)) {
    $ConfigDir = Join-Path $env:USERPROFILE ".config\opencode"
}
$AgentsDir  = Join-Path $ConfigDir "agents"
$SkillsDir  = Join-Path $ConfigDir "skills"
$PluginsDir = Join-Path $ConfigDir "plugins"
$BackupRoot = $null
if ($UpdateCoffeeMix) {
    if ([string]::IsNullOrWhiteSpace($BackupDir)) {
        $BackupRoot = Join-Path (Join-Path $ConfigDir ".coffeemix-backups") (Get-Date -Format "yyyyMMdd-HHmmss")
    } else {
        $BackupRoot = $BackupDir
    }
}

Write-Host "`n coffeemix_all 0.2 — Global Merge Installer" -ForegroundColor White
Write-Host " Package : $PackageDir" -ForegroundColor DarkGray
Write-Host " Target  : $ConfigDir" -ForegroundColor DarkGray
if ($UpdateCoffeeMix) {
    Write-Host " Mode    : UpdateCoffeeMix (refresh CoffeeMix-owned package assets only)" -ForegroundColor DarkGray
    Write-Host " Backup : $BackupRoot" -ForegroundColor DarkGray
    if ($WhatIf) {
        Write-Host " WhatIf  : enabled — no files or backups will be written" -ForegroundColor DarkGray
    }
} else {
    Write-Host " Mode    : Fresh/additive install (existing files are skipped)" -ForegroundColor DarkGray
}

# ── Safe update helpers ─────────────────────────────────────────────
function Get-RelativeBackupPath {
    param(
        [Parameter(Mandatory=$true)][string]$Path,
        [Parameter(Mandatory=$true)][string]$BasePath
    )

    $FullPath = [System.IO.Path]::GetFullPath($Path)
    $FullBase = [System.IO.Path]::GetFullPath($BasePath)
    if (-not $FullBase.EndsWith([System.IO.Path]::DirectorySeparatorChar)) {
        $FullBase = $FullBase + [System.IO.Path]::DirectorySeparatorChar
    }

    if ($FullPath.StartsWith($FullBase, [System.StringComparison]::OrdinalIgnoreCase)) {
        return $FullPath.Substring($FullBase.Length)
    }

    return (Split-Path $FullPath -Leaf)
}

function Backup-ExistingItem {
    param(
        [Parameter(Mandatory=$true)][string]$Path,
        [Parameter(Mandatory=$true)][string]$Label
    )

    if (-not (Test-Path $Path)) { return }

    $RelativePath = Get-RelativeBackupPath -Path $Path -BasePath $ConfigDir
    $BackupPath = Join-Path $BackupRoot $RelativePath
    $BackupParent = Split-Path $BackupPath -Parent

    if ($WhatIf) {
        Write-INFO "Would back up $Label to $BackupPath"
        return
    }

    if (-not (Test-Path $BackupParent)) {
        New-Item -ItemType Directory -Path $BackupParent -Force | Out-Null
    }

    Copy-Item $Path -Destination $BackupPath -Recurse -Force
    Write-OK "Backed up $Label to $BackupPath"
}

function Copy-CoffeeMixFile {
    param(
        [Parameter(Mandatory=$true)][string]$SourcePath,
        [Parameter(Mandatory=$true)][string]$DestinationPath,
        [Parameter(Mandatory=$true)][string]$Label
    )

    if (Test-Path $DestinationPath) {
        if ($UpdateCoffeeMix) {
            Backup-ExistingItem -Path $DestinationPath -Label $Label
            if ($WhatIf) {
                Write-INFO "Would update CoffeeMix-owned file: $Label"
            } else {
                Copy-Item $SourcePath -Destination $DestinationPath -Force
                Write-OK "Updated $Label"
            }
        } else {
            Write-SKIP "$Label already exists — keeping existing"
        }
    } else {
        if ($WhatIf) {
            Write-INFO "Would install new CoffeeMix-owned file: $Label"
        } else {
            Copy-Item $SourcePath -Destination $DestinationPath
            Write-OK "$Label"
        }
    }
}

function Copy-CoffeeMixDirectory {
    param(
        [Parameter(Mandatory=$true)][string]$SourcePath,
        [Parameter(Mandatory=$true)][string]$DestinationPath,
        [Parameter(Mandatory=$true)][string]$Label
    )

    if (Test-Path $DestinationPath) {
        if ($UpdateCoffeeMix) {
            Backup-ExistingItem -Path $DestinationPath -Label $Label
            if ($WhatIf) {
                Write-INFO "Would update CoffeeMix-owned directory: $Label"
            } else {
                Copy-Item (Join-Path $SourcePath "*") -Destination $DestinationPath -Recurse -Force
                Write-OK "Updated $Label"
            }
        } else {
            Write-SKIP "$Label already exists — keeping existing"
        }
    } else {
        if ($WhatIf) {
            Write-INFO "Would install new CoffeeMix-owned directory: $Label"
        } else {
            Copy-Item $SourcePath -Destination $DestinationPath -Recurse
            Write-OK "$Label"
        }
    }
}

# ── Pre-flight checks ───────────────────────────────────────────────
if (-not (Test-Path $PackageDir)) {
    Write-ERR "Package directory not found: $PackageDir"
    exit 1
}

# Verify OMO/OpenAgent baseline is present. Prefer config detection so mock
# validation can run without requiring a global npm package path.
$OmoConfigPaths = @(
    (Join-Path $ConfigDir "oh-my-opencode.json"),
    (Join-Path $ConfigDir "oh-my-openagent.json")
)
$OmoPackagePaths = @(
    (Join-Path $env:APPDATA "npm\node_modules\oh-my-opencode\package.json"),
    (Join-Path $env:APPDATA "npm\node_modules\oh-my-openagent\package.json")
)
$DetectedOmoConfig = $OmoConfigPaths | Where-Object { Test-Path $_ } | Select-Object -First 1
$DetectedOmoPackage = $OmoPackagePaths | Where-Object { Test-Path $_ } | Select-Object -First 1
if ($DetectedOmoConfig) {
    Write-OK "OMO/OpenAgent config detected: $DetectedOmoConfig"
} elseif ($DetectedOmoPackage) {
    $OmoPkg = Get-Content $DetectedOmoPackage -Raw | ConvertFrom-Json
    Write-OK "$($OmoPkg.name) v$($OmoPkg.version) detected"
} else {
    Write-ERR "OMO/OpenAgent baseline not found. Expected oh-my-opencode.json, oh-my-openagent.json, or a global npm package."
    exit 1
}

# ── Model Mapping Strategy ──────────────────────────────────────────
function Get-ModelMapping {
    <#
    .SYNOPSIS
        Determine model assignments for gb-* agents using OMO's existing config.

    .DESCRIPTION
        Priority order:
        1. Read existing oh-my-opencode.json — if it has model mappings from
           a previous OMO install, use those as the source of truth.
        2. Read opencode.json provider section — detect available providers
           and assign based on provider name patterns.
        3. Return placeholder mappings.
    #>

    $DestOmo = Join-Path $ConfigDir "oh-my-opencode.json"
    $DestOpencode = Join-Path $ConfigDir "opencode.json"

    # Strategy 1: Use existing OMO config model mappings
    if (-not $PlaceholderOnly -and (Test-Path $DestOmo)) {
        try {
            $OmoConfig = Get-Content $DestOmo -Raw | ConvertFrom-Json
            $ExistingModels = @{}

            # Collect all unique model strings from existing agents
            foreach ($agent in $OmoConfig.agents.PSObject.Properties) {
                if ($agent.Value.model) {
                    $ExistingModels[$agent.Name] = $agent.Value.model
                }
            }

            if ($ExistingModels.Count -gt 0) {
                Write-INFO "Using existing OMO model mappings ($($ExistingModels.Count) agents found)"

                # Build a model pool from existing assignments
                $ModelPool = @{}
                foreach ($model in $ExistingModels.Values) {
                    $ModelPool[$model] = $true
                }

                # OMO's default agent → role mapping for reference
                # sisyphus → orchestrator (capable general model)
                # oracle → high reasoning
                # librarian → fast/cheap model
                # explore → fast model
                # hephaestus → coding model
                # prometheus/metis/momus → medium reasoning

                # Assign gb-* agents based on variant similarity to existing agents
                $GbAssignments = @{}

                # High reasoning agents (oracle, momus pattern)
                $HighModel = $ExistingModels["oracle"] -or $ExistingModels["momus"]
                # Medium reasoning agents (prometheus, metis pattern)
                $MediumModel = $ExistingModels["prometheus"] -or $ExistingModels["metis"]
                # Fast/cheap agents (librarian, explore pattern)
                $FastModel = $ExistingModels["librarian"] -or $ExistingModels["explore"]
                # Coding agents (hephaestus pattern)
                $CodingModel = $ExistingModels["hephaestus"]

                # gb-* agent role assignments
                $GbRoles = @{
                    "gb-commit"    = "medium"
                    "gb-review"    = "high"
                    "gb-compact"   = "medium"
                    "gb-worktree"  = "medium"
                    "gb-resume"    = "medium"
                    "gb-doctor"    = "medium"
                    "gb-memory"    = "medium"
                    "gb-config"    = "medium"
                    "gb-share"     = "medium"
                    "gb-statusline"= "medium"
                    "gb-debug"     = "high"
                    "gb-ultraplan" = "high"
                    "gb-teleport"  = "medium"
                    "gb-plugin"    = "medium"
                }

                foreach ($gb in $GbRoles.GetEnumerator()) {
                    $role = $gb.Value
                    switch ($role) {
                        "high"   { $GbAssignments[$gb.Name] = $HighModel }
                        "medium" { $GbAssignments[$gb.Name] = $MediumModel }
                        "fast"   { $GbAssignments[$gb.Name] = $FastModel }
                    }
                }

                return $GbAssignments
            }
        } catch {
            Write-INFO "Could not parse existing OMO config, falling back to provider scan"
        }
    }

    # Strategy 2: Scan opencode.json providers
    if (-not $PlaceholderOnly -and (Test-Path $DestOpencode)) {
        try {
            $OpencodeConfig = Get-Content $DestOpencode -Raw | ConvertFrom-Json
            if ($OpencodeConfig.provider) {
                $Providers = @()
                foreach ($p in $OpencodeConfig.provider.PSObject.Properties) {
                    foreach ($m in $p.Value.models.PSObject.Properties) {
                        $Providers += "$($p.Name)/$($m.Name)"
                    }
                }

                if ($Providers.Count -gt 0) {
                    Write-INFO "Detected $($Providers.Count) provider(s) from opencode.json"
                    $DefaultModel = $Providers[0]

                    $GbAssignments = @{}
                    foreach ($name in @("gb-commit","gb-review","gb-compact","gb-worktree",
                                        "gb-resume","gb-doctor","gb-memory","gb-config",
                                        "gb-share","gb-statusline","gb-debug","gb-ultraplan",
                                        "gb-teleport","gb-plugin")) {
                        $GbAssignments[$name] = $DefaultModel
                    }
                    return $GbAssignments
                }
            }
        } catch {
            Write-INFO "Could not parse opencode.json providers"
        }
    }

    # Strategy 3: Placeholders
    Write-INFO "No existing model mappings found — using placeholders"
    $GbAssignments = @{}
    foreach ($name in @("gb-commit","gb-review","gb-compact","gb-worktree",
                        "gb-resume","gb-doctor","gb-memory","gb-config",
                        "gb-share","gb-statusline","gb-debug","gb-ultraplan",
                        "gb-teleport","gb-plugin")) {
        $GbAssignments[$name] = "YOUR_PROVIDER/YOUR_MODEL"
    }
    return $GbAssignments
}

# ── 1. Agents (14 gb-*.md) ─────────────────────────────────────────
Write-HDR "Installing agents (14 gb-* specialists)"
$SrcAgents = Join-Path $PackageDir ".opencode\agents"
if (Test-Path $SrcAgents) {
    if (-not (Test-Path $AgentsDir)) {
        if ($WhatIf) { Write-INFO "Would create directory: $AgentsDir" }
        else { New-Item -ItemType Directory -Path $AgentsDir -Force | Out-Null }
    }
    Get-ChildItem $SrcAgents -Filter "gb-*.md" | ForEach-Object {
        $Dest = Join-Path $AgentsDir $_.Name
        Copy-CoffeeMixFile -SourcePath $_.FullName -DestinationPath $Dest -Label $_.Name
    }
} else {
    Write-ERR ".opencode/agents/ not found in package"
}

# ── 2. Skills (8 skills) ────────────────────────────────────────────
Write-HDR "Installing skills (8 workflow skills)"
$SrcSkills = Join-Path $PackageDir ".opencode\skills"
if (Test-Path $SrcSkills) {
    if (-not (Test-Path $SkillsDir)) {
        if ($WhatIf) { Write-INFO "Would create directory: $SkillsDir" }
        else { New-Item -ItemType Directory -Path $SkillsDir -Force | Out-Null }
    }
    Get-ChildItem $SrcSkills -Directory | ForEach-Object {
        $Dest = Join-Path $SkillsDir $_.Name
        Copy-CoffeeMixDirectory -SourcePath $_.FullName -DestinationPath $Dest -Label $_.Name
    }
} else {
    Write-ERR ".opencode/skills/ not found in package"
}

# ── 3. Plugins ──────────────────────────────────────────────────────
Write-HDR "Installing plugins"
$SrcPlugins = Join-Path $PackageDir ".opencode\plugins"
if (Test-Path $SrcPlugins) {
    if (-not (Test-Path $PluginsDir)) {
        if ($WhatIf) { Write-INFO "Would create directory: $PluginsDir" }
        else { New-Item -ItemType Directory -Path $PluginsDir -Force | Out-Null }
    }
    Get-ChildItem $SrcPlugins -File | ForEach-Object {
        $Dest = Join-Path $PluginsDir $_.Name
        Copy-CoffeeMixFile -SourcePath $_.FullName -DestinationPath $Dest -Label $_.Name
    }
}

# ── 4. AGENTS.md ────────────────────────────────────────────────────
Write-HDR "Installing AGENTS.md"
$SrcAgentsMd = Join-Path $PackageDir "AGENTS.md"
$DestAgentsMd = Join-Path $ConfigDir "AGENTS.md"
if (Test-Path $SrcAgentsMd) {
    if (Test-Path $DestAgentsMd) {
        Write-SKIP "AGENTS.md already exists — keeping existing"
    } else {
        if ($WhatIf) {
            Write-INFO "Would install AGENTS.md"
        } else {
            Copy-Item $SrcAgentsMd -Destination $DestAgentsMd
            Write-OK "AGENTS.md"
        }
    }
}

# ── 5. tui.json ─────────────────────────────────────────────────────
Write-HDR "Installing tui.json"
$SrcTui = Join-Path $PackageDir "tui.json"
$DestTui = Join-Path $ConfigDir "tui.json"
if (Test-Path $SrcTui) {
    if (Test-Path $DestTui) {
        Write-SKIP "tui.json already exists — keeping existing"
    } else {
        if ($WhatIf) {
            Write-INFO "Would install tui.json"
        } else {
            Copy-Item $SrcTui -Destination $DestTui
            Write-OK "tui.json"
        }
    }
}

# ── 6. opencode.json — merge plugin ─────────────────────────────────
Write-HDR "Checking opencode.json plugin"
$SrcOpencode = Join-Path $PackageDir "opencode.json"
$DestOpencode = Join-Path $ConfigDir "opencode.json"
if (Test-Path $SrcOpencode) {
    if (Test-Path $DestOpencode) {
        $DestJson = Get-Content $DestOpencode -Raw | ConvertFrom-Json
        $SrcJson = Get-Content $SrcOpencode -Raw | ConvertFrom-Json

        $PluginName = if ($SrcJson.plugin -contains "oh-my-openagent") { "oh-my-openagent" } else { "oh-my-opencode" }

        if (-not $DestJson.PSObject.Properties["plugin"]) {
            $DestJson | Add-Member -NotePropertyName "plugin" -NotePropertyValue @()
        }
        $PluginList = @($DestJson.plugin)
        if ($PluginList -notcontains $PluginName) {
            $DestJson.plugin = @($PluginList + $PluginName)
            if ($WhatIf) {
                Write-INFO "Would add '$PluginName' to plugin array"
            } else {
                $DestJson | ConvertTo-Json -Depth 10 | Set-Content $DestOpencode -Encoding UTF8
                Write-OK "Added '$PluginName' to plugin array"
            }
        } else {
            Write-SKIP "Plugin '$PluginName' already present"
        }
    } else {
        Write-ERR "opencode.json not found at $ConfigDir"
    }
}

# ── 7. oh-my-opencode.json — merge gb-* agents with model mapping ───
Write-HDR "Merging gb-* agents into oh-my-opencode.json"
$SrcOmo = Join-Path $PackageDir "oh-my-opencode.json"
$DestOmo = Join-Path $ConfigDir "oh-my-opencode.json"
if (Test-Path $SrcOmo) {
    if (Test-Path $DestOmo) {
        $SrcJson = Get-Content $SrcOmo -Raw | ConvertFrom-Json
        $DestJson = Get-Content $DestOmo -Raw | ConvertFrom-Json

        # Get model mappings
        $ModelMap = Get-ModelMapping

        $Merged = 0
        foreach ($agent in $SrcJson.agents.PSObject.Properties) {
            if ($agent.Name -like "gb-*") {
                if (-not $DestJson.agents.PSObject.Properties[$agent.Name]) {
                    # Use detected model or fall back to placeholder
                    $ModelValue = $ModelMap[$agent.Name]
                    if (-not $ModelValue) { $ModelValue = "YOUR_PROVIDER/YOUR_MODEL" }

                    $AgentObj = @{
                        model = $ModelValue
                    }
                    if ($agent.Value.variant) {
                        $AgentObj.variant = $agent.Value.variant
                    }

                    $DestJson.agents | Add-Member -NotePropertyName $agent.Name -NotePropertyValue $AgentObj
                    $Merged++
                    Write-OK "$($agent.Name) → $ModelValue"
                } else {
                    Write-SKIP "$($agent.Name) already exists"
                }
            }
        }
        if ($Merged -gt 0) {
            if ($WhatIf) {
                Write-INFO "Would merge $Merged gb-* agents with model mappings"
            } else {
                $DestJson | ConvertTo-Json -Depth 10 | Set-Content $DestOmo -Encoding UTF8
                Write-OK "Merged $Merged gb-* agents with model mappings"
            }
        } else {
            Write-SKIP "All gb-* agents already present"
        }
    } else {
        Write-ERR "oh-my-opencode.json not found at $ConfigDir"
    }
}

# ── Summary ─────────────────────────────────────────────────────────
if ($UpdateCoffeeMix) {
    Write-HDR "CoffeeMix update complete"
} else {
    Write-HDR "Installation complete"
}
Write-Host ""
Write-Host "  Installed to: $ConfigDir" -ForegroundColor White
if ($UpdateCoffeeMix) {
    Write-Host "  Mode: CoffeeMix-owned asset update" -ForegroundColor White
    if ($WhatIf) {
        Write-Host "  WhatIf: no files or backups were written" -ForegroundColor DarkGray
        Write-Host "  Backup preview: $BackupRoot" -ForegroundColor DarkGray
    } else {
        Write-Host "  Backup location: $BackupRoot" -ForegroundColor DarkGray
    }
    Write-Host "  Preserved: providers, models, MCP, user config, AGENTS.md, and tui.json" -ForegroundColor DarkGray
} else {
    Write-Host "  Mode: fresh/additive install; existing files were skipped" -ForegroundColor White
}
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor White
Write-Host "  1. Restart OpenCode (close all instances and reopen)" -ForegroundColor DarkGray
Write-Host "  2. Press Tab to verify gb-* agents appear" -ForegroundColor DarkGray
Write-Host "  3. Run: bunx oh-my-openagent doctor" -ForegroundColor DarkGray
if ($UpdateCoffeeMix -and -not $WhatIf) {
    Write-Host "  4. Rollback if needed: copy files from the backup location above back into $ConfigDir" -ForegroundColor DarkGray
} elseif ($UpdateCoffeeMix -and $WhatIf) {
    Write-Host "  4. Re-run without -WhatIf to create backups and apply the CoffeeMix update" -ForegroundColor DarkGray
}
Write-Host ""
Write-Host "  Model configuration:" -ForegroundColor White
Write-Host "  - Edit $ConfigDir\oh-my-opencode.json to customize gb-* agent models" -ForegroundColor DarkGray
Write-Host "  - Or run: bunx oh-my-opencode install (re-runs OMO model setup)" -ForegroundColor DarkGray
Write-Host ""


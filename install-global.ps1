#Requires -Version 5.1
<#
.SYNOPSIS
    Install coffeemix_all into the global OpenCode configuration directory.

.DESCRIPTION
    Copies gb-* specialist agents, skills, plugins, and configuration files
    from the coffeemix_all package into %USERPROFILE%\.config\opencode\.

    Model mapping modes (in priority order):
      1. Auto-detect: Reads existing oh-my-opencode.json model mappings
         and applies them to new gb-* agents.
      2. Provider scan: Reads opencode.json provider section to build
         model assignments based on provider names.
      3. Placeholder: Uses YOUR_PROVIDER/YOUR_MODEL for manual setup.

    This script performs a MERGE — it does NOT overwrite existing files
    unless they are coffeemix_all-specific additions.

.PARAMETER PackageDir
    Path to the coffeemix_all package directory.
    Defaults to the script's parent directory.

.PARAMETER WhatIf
    Preview what would be copied without making changes.

.PARAMETER PlaceholderOnly
    Skip model auto-detection and use YOUR_PROVIDER/YOUR_MODEL for all agents.

.EXAMPLE
    .\install-global.ps1
    .\install-global.ps1 -PackageDir "C:\path\to\coffeemix_all_0_1"
    .\install-global.ps1 -WhatIf
    .\install-global.ps1 -PlaceholderOnly
#>

param(
    [string]$PackageDir = $PSScriptRoot,
    [switch]$WhatIf,
    [switch]$PlaceholderOnly
)

$ErrorActionPreference = "Stop"

# ── Colors ──────────────────────────────────────────────────────────
function Write-OK   { param($m) Write-Host "  ✓ " -NoNewline -ForegroundColor Green; Write-Host $m }
function Write-SKIP { param($m) Write-Host "  ⊘ " -NoNewline -ForegroundColor Yellow; Write-Host $m }
function Write-ERR  { param($m) Write-Host "  ✗ " -NoNewline -ForegroundColor Red; Write-Host $m }
function Write-INFO { param($m) Write-Host "  ℹ " -NoNewline -ForegroundColor Cyan; Write-Host $m }
function Write-HDR  { param($m) Write-Host "`n► $m" -ForegroundColor Cyan }

# ── Resolve paths ───────────────────────────────────────────────────
$ConfigDir  = Join-Path $env:USERPROFILE ".config\opencode"
$AgentsDir  = Join-Path $ConfigDir "agents"
$SkillsDir  = Join-Path $ConfigDir "skills"
$PluginsDir = Join-Path $ConfigDir "plugins"

Write-Host "`n coffeemix_all — Global Installer" -ForegroundColor White
Write-Host " Package : $PackageDir" -ForegroundColor DarkGray
Write-Host " Target  : $ConfigDir" -ForegroundColor DarkGray

# ── Pre-flight checks ───────────────────────────────────────────────
if (-not (Test-Path $PackageDir)) {
    Write-ERR "Package directory not found: $PackageDir"
    exit 1
}

# Verify OMO plugin is globally installed
$OmoPath = Join-Path $env:APPDATA "npm\node_modules\oh-my-opencode\package.json"
if (Test-Path $OmoPath) {
    $OmoVer = (Get-Content $OmoPath | ConvertFrom-Json).version
    Write-OK "oh-my-opencode v$OmoVer detected"
} else {
    Write-ERR "oh-my-opencode not found globally. Run: npm install -g oh-my-opencode"
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
    if (-not (Test-Path $AgentsDir)) { New-Item -ItemType Directory -Path $AgentsDir -Force | Out-Null }
    Get-ChildItem $SrcAgents -Filter "gb-*.md" | ForEach-Object {
        $Dest = Join-Path $AgentsDir $_.Name
        if (Test-Path $Dest) {
            Write-SKIP "$($_.Name) already exists — keeping existing"
        } else {
            Copy-Item $_.FullName -Destination $Dest -WhatIf:$WhatIf
            Write-OK "$($_.Name)"
        }
    }
} else {
    Write-ERR ".opencode/agents/ not found in package"
}

# ── 2. Skills (8 skills) ────────────────────────────────────────────
Write-HDR "Installing skills (8 workflow skills)"
$SrcSkills = Join-Path $PackageDir ".opencode\skills"
if (Test-Path $SrcSkills) {
    if (-not (Test-Path $SkillsDir)) { New-Item -ItemType Directory -Path $SkillsDir -Force | Out-Null }
    Get-ChildItem $SrcSkills -Directory | ForEach-Object {
        $Dest = Join-Path $SkillsDir $_.Name
        if (Test-Path $Dest) {
            Write-SKIP "$($_.Name) already exists — keeping existing"
        } else {
            Copy-Item $_.FullName -Destination $Dest -Recurse -WhatIf:$WhatIf
            Write-OK "$($_.Name)"
        }
    }
} else {
    Write-ERR ".opencode/skills/ not found in package"
}

# ── 3. Plugins ──────────────────────────────────────────────────────
Write-HDR "Installing plugins"
$SrcPlugins = Join-Path $PackageDir ".opencode\plugins"
if (Test-Path $SrcPlugins) {
    if (-not (Test-Path $PluginsDir)) { New-Item -ItemType Directory -Path $PluginsDir -Force | Out-Null }
    Get-ChildItem $SrcPlugins -File | ForEach-Object {
        $Dest = Join-Path $PluginsDir $_.Name
        Copy-Item $_.FullName -Destination $Dest -Force -WhatIf:$WhatIf
        Write-OK "$($_.Name)"
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
        Copy-Item $SrcAgentsMd -Destination $DestAgentsMd -WhatIf:$WhatIf
        Write-OK "AGENTS.md"
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
        Copy-Item $SrcTui -Destination $DestTui -WhatIf:$WhatIf
        Write-OK "tui.json"
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

        if ($DestJson.plugin -notcontains $PluginName) {
            $DestJson.plugin += ,$PluginName
            $DestJson | ConvertTo-Json -Depth 10 | Set-Content $DestOpencode -Encoding UTF8
            Write-OK "Added '$PluginName' to plugin array"
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
            $DestJson | ConvertTo-Json -Depth 10 | Set-Content $DestOmo -Encoding UTF8
            Write-OK "Merged $Merged gb-* agents with model mappings"
        } else {
            Write-SKIP "All gb-* agents already present"
        }
    } else {
        Write-ERR "oh-my-opencode.json not found at $ConfigDir"
    }
}

# ── Summary ─────────────────────────────────────────────────────────
Write-HDR "Installation complete"
Write-Host ""
Write-Host "  Installed to: $ConfigDir" -ForegroundColor White
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor White
Write-Host "  1. Restart OpenCode (close all instances and reopen)" -ForegroundColor DarkGray
Write-Host "  2. Press Tab to verify gb-* agents appear" -ForegroundColor DarkGray
Write-Host "  3. Run: bunx oh-my-openagent doctor" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  Model configuration:" -ForegroundColor White
Write-Host "  - Edit $ConfigDir\oh-my-opencode.json to customize gb-* agent models" -ForegroundColor DarkGray
Write-Host "  - Or run: bunx oh-my-opencode install (re-runs OMO model setup)" -ForegroundColor DarkGray
Write-Host ""

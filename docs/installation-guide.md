# Installation Guide — coffeemix_all 0.2

## 1. Scope

OMO / oh-my-openagent must already be installed. This package does not install OMO and does not replace OMO orchestration, routing, model routing, skill loading, provider setup, or baseline agents.

Use this guide for a fresh CoffeeMix 0.2 install. If CoffeeMix 0.1 is already installed in your global OpenCode config, follow [`UPDATE.md`](./UPDATE.md) instead.

## 2. Fresh install path

The default installer path is additive and skip-only. It copies missing CoffeeMix 0.2 files into the target OpenCode config and keeps existing files.

Always preview first:

```powershell
.\install-global.ps1 -WhatIf
```

For safe mock validation, point `-ConfigDir` at a mock OpenCode config directory:

```powershell
$mock = "C:\temp\coffeemix-0-2-opencode-config"
New-Item -ItemType Directory -Force -Path $mock | Out-Null
Copy-Item "$env:USERPROFILE\.config\opencode\oh-my-opencode.json" $mock -ErrorAction SilentlyContinue

.\install-global.ps1 -WhatIf -ConfigDir $mock
```

The mock directory must look like an OpenCode config directory. It should contain `oh-my-opencode.json` or `oh-my-openagent.json` so OMO detection can pass. It should not be the CoffeeMix package directory.

After reviewing the preview and backing up your real config, run the fresh install only if you are not trying to update old CoffeeMix files:

```powershell
.\install-global.ps1
```

## 3. CoffeeMix 0.1 update path

Do not use the default installer as an update path from CoffeeMix 0.1 to 0.2. The default path skips existing files, so old CoffeeMix content can remain active while the user thinks the update succeeded.

Existing CoffeeMix users must use the explicit CoffeeMix-owned update mode documented in [`UPDATE.md`](./UPDATE.md):

```powershell
$backup = "$env:USERPROFILE\.config\opencode-backups\coffeemix-0-1-before-0-2"
.\install-global.ps1 -WhatIf -UpdateCoffeeMix -BackupDir $backup
.\install-global.ps1 -UpdateCoffeeMix -BackupDir $backup
```

If the installer you have does not list `-UpdateCoffeeMix` and `-BackupDir`, stop. Do not tell users that a plain install updates existing CoffeeMix 0.1 content.

## 4. Merge semantics

- The package adds CoffeeMix `gb-*` agents, local skills, plugin files, validation tools, and config scaffolding to an OpenCode config.
- The default install keeps existing files and reports skips.
- `-UpdateCoffeeMix` is the intended mode for replacing CoffeeMix-owned files only.
- `-BackupDir` is required for safe replacement and rollback during update mode.
- Existing OMO control plane files must not be removed or replaced.
- Model/provider placeholders must be adjusted by the user to match local or global config.

## 5. Rollback

Before a real update, create a backup outside the active config directory:

```powershell
$config = "$env:USERPROFILE\.config\opencode"
$backup = "$env:USERPROFILE\.config\opencode-backups\coffeemix-0-1-before-0-2"
New-Item -ItemType Directory -Force -Path $backup | Out-Null
Copy-Item -Recurse -Force "$config\*" $backup
```

To roll back:

```powershell
Copy-Item -Recurse -Force "$backup\*" $config
```

## 6. Post-install verification

Check the target config after install or update:

```powershell
$config = "$env:USERPROFILE\.config\opencode"

Test-Path "$config\oh-my-opencode.json"
Test-Path "$config\agents\gb-review.md"
Test-Path "$config\agents\gb-debug.md"
Test-Path "$config\skills\verification-before-completion\SKILL.md"

Get-Content "$config\oh-my-opencode.json" -Raw | ConvertFrom-Json | Out-Null
if (Test-Path "$config\opencode.json") {
  Get-Content "$config\opencode.json" -Raw | ConvertFrom-Json | Out-Null
}
```

Package validation can also be run from the package root:

```powershell
python tools/workspace_smoke_runner.py
python tools/routing_validation_runner.py
```

## 7. Prohibited claims

- Do not claim OMO replacement.
- Do not claim copied router, model, or loader behavior.
- Do not claim automatic CoffeeMix 0.1 update behavior through the default installer.
- Do not claim default GBrain, browser, checkpoint, or design runtime support.
- Broad runtime e2e is not required for package setup.

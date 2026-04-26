# CoffeeMix 0.1 to 0.2 Update Guide

This guide is for users who already installed CoffeeMix 0.1 into their global OpenCode config and want to move to CoffeeMix 0.2 safely.

If you have never installed CoffeeMix before, use the fresh install path in [`installation-guide.md`](./installation-guide.md). The default install is additive and skip-only. It is safe for a fresh setup, but it is not enough to update existing CoffeeMix 0.1 files.

## Safety rule

OMO / oh-my-openagent remains the control plane. CoffeeMix 0.2 is an overlay of `gb-*` specialists, local skills, validation files, and a UI badge plugin. The update path must not replace OMO routing, model routing, provider setup, global skill loading, or baseline agents.

## Why explicit update mode is required

The default installer protects existing files. When a CoffeeMix file already exists, the default path keeps it and reports a skip. That behavior prevents accidental overwrites, but it can also make a 0.1 user think they updated while old CoffeeMix files remain active.

Existing CoffeeMix users must use the explicit CoffeeMix-owned update mode once their installer supports it:

```powershell
.\install-global.ps1 -UpdateCoffeeMix -BackupDir "C:\path\to\backup"
```

If `Get-Help .\install-global.ps1 -Full` or the script header does not list `-UpdateCoffeeMix` and `-BackupDir`, stop. Do not claim the default install updated CoffeeMix 0.1 content.

## Before you update

Run all commands from the CoffeeMix 0.2 package root:

```powershell
cd C:\path\to\opencode_coffeemix_all_0_2
```

Confirm the package is the 0.2 package, then inspect the installer parameters:

```powershell
Get-Help .\install-global.ps1 -Full
```

Expected update parameters:

- `-WhatIf`, previews without writing.
- `-ConfigDir`, points at a target OpenCode config directory.
- `-UpdateCoffeeMix`, permits replacement of CoffeeMix-owned files only.
- `-BackupDir`, stores files before replacement so rollback is possible.

## Mock ConfigDir preview

Use a mock config before touching your real global config. The mock directory must look like an OpenCode config directory, not a package directory. It should contain an OMO config file such as `oh-my-opencode.json` or `oh-my-openagent.json`, plus any CoffeeMix 0.1 files you want to rehearse against.

```powershell
$real = "$env:USERPROFILE\.config\opencode"
$mock = "C:\temp\coffeemix-0-2-update-mock"
New-Item -ItemType Directory -Force -Path $mock | Out-Null
Copy-Item -Recurse -Force "$real\*" $mock

.\install-global.ps1 -WhatIf -ConfigDir $mock -UpdateCoffeeMix -BackupDir "C:\temp\coffeemix-0-2-update-backup"
```

Expected mock behavior:

- `-WhatIf` must not write into the mock directory.
- OMO config detection should succeed from the mock `oh-my-opencode.json` or `oh-my-openagent.json`.
- Existing CoffeeMix-owned files should be shown as update candidates only when `-UpdateCoffeeMix` is present.
- Non-CoffeeMix OMO files should remain outside the update set.

## Back up the real config

Use a backup directory that is outside the active OpenCode config:

```powershell
$config = "$env:USERPROFILE\.config\opencode"
$backup = "$env:USERPROFILE\.config\opencode-backups\coffeemix-0-1-before-0-2"
New-Item -ItemType Directory -Force -Path $backup | Out-Null
Copy-Item -Recurse -Force "$config\*" $backup
```

The installer update mode should also receive `-BackupDir` so it can save each CoffeeMix-owned file before replacing it:

```powershell
.\install-global.ps1 -WhatIf -UpdateCoffeeMix -BackupDir $backup
```

Review the preview. If it includes OMO control plane files, provider secrets, unrelated plugins, or non-CoffeeMix agent files as replacement targets, stop.

## Run the update

After the preview is clean, run the explicit update:

```powershell
.\install-global.ps1 -UpdateCoffeeMix -BackupDir $backup
```

Do not use a plain `.\install-global.ps1` run as an update path. The plain path is additive and skip-only, so existing CoffeeMix 0.1 files may remain unchanged.

## Post-update verification

Check that CoffeeMix 0.2 files are present and that OMO config still exists:

```powershell
$config = "$env:USERPROFILE\.config\opencode"

Test-Path "$config\oh-my-opencode.json"
Test-Path "$config\agents\gb-review.md"
Test-Path "$config\agents\gb-debug.md"
Test-Path "$config\skills\verification-before-completion\SKILL.md"
Test-Path "$config\plugins"

Get-Content "$config\oh-my-opencode.json" -Raw | ConvertFrom-Json | Out-Null
if (Test-Path "$config\opencode.json") {
  Get-Content "$config\opencode.json" -Raw | ConvertFrom-Json | Out-Null
}
```

Optional package validation, run from the package root:

```powershell
python tools/workspace_smoke_runner.py
python tools/routing_validation_runner.py
```

Those commands validate this package. They do not replace a final manual check of your global OpenCode config.

## Rollback

If the update result is wrong, restore from the backup you created before the update:

```powershell
$config = "$env:USERPROFILE\.config\opencode"
$backup = "$env:USERPROFILE\.config\opencode-backups\coffeemix-0-1-before-0-2"

Copy-Item -Recurse -Force "$backup\*" $config
```

After rollback, rerun the JSON parse checks above and confirm OpenCode plus OMO still start with your previous configuration.

## Agent guidance

Coding agents working on this package should keep update work docs-only unless the user explicitly asks for installer changes. Do not touch global config during documentation work. Do not modify agents, skills, plugins, package payload files, or generated reports as part of this guide update.

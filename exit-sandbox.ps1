if (Test-Path Env:\OPENCODE_CONFIG_DIR) {
    Remove-Item Env:\OPENCODE_CONFIG_DIR
    Write-Host "[coffeemix_all Exit] OPENCODE_CONFIG_DIR removed."
} else {
    Write-Host "[coffeemix_all Exit] OPENCODE_CONFIG_DIR was not set."
}

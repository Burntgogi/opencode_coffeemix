@echo off
setlocal
set "SANDBOX_DIR=C:\Work\claude_pickup\opencode_coffeemix_all_sandbox"
set "OPENCODE_BIN=C:\Users\JMTFAM01\AppData\Roaming\npm\opencode.cmd"
start "OpenCode coffeemix_all Sandbox" cmd /K "set OPENCODE_CONFIG_DIR=%SANDBOX_DIR% && cd /d %SANDBOX_DIR% && echo [coffeemix_all] OPENCODE_CONFIG_DIR=%%OPENCODE_CONFIG_DIR%% && echo [coffeemix_all] CD=%%CD%% && call %OPENCODE_BIN%"
endlocal

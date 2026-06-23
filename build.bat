@echo off
REM Link the single self-contained cufes.exe from cufes_ffi.lib + the welcome shim.
REM 1) Download cufes_ffi.lib from this repo's Release into prebuilt\
REM 2) Run from a "x64 Native Tools Command Prompt for VS":
cl /nologo /MD welcome.c @prebuilt\link.args /Fe:cufes.exe /link /SUBSYSTEM:WINDOWS /ENTRY:mainCRTStartup
echo Built cufes.exe — sign it, then ship.

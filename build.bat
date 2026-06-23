@echo off
REM Link the single self-contained cufes.exe from cufes_ffi.lib + the welcome shim.
REM OpenSSL is statically linked INTO cufes_ffi.lib — no libcrypto DLL to ship.
REM   1) Download cufes_ffi.lib from this repo's Release into prebuilt\
REM   2) Run from a "x64 Native Tools Command Prompt for VS":
cl /nologo /MD welcome.c @prebuilt\link.args /Fe:cufes.exe /link /SUBSYSTEM:WINDOWS /ENTRY:mainCRTStartup
echo.
echo Built cufes.exe (self-contained: no libcrypto DLL). Runtime prereqs on the target:
echo Visual C++ Redistributable (x64) + DirectML.dll (standard on Windows 10 1903+).
echo Sign cufes.exe, then ship.

@echo off
REM Link the single cufes.exe from cufes_ffi.lib + the welcome shim, then stage the
REM OpenSSL runtime DLL beside it.
REM   1) Download cufes_ffi.lib from this repo's Release into prebuilt\
REM   2) Run from a "x64 Native Tools Command Prompt for VS":
cl /nologo /MD welcome.c @prebuilt\link.args /Fe:cufes.exe /link /SUBSYSTEM:WINDOWS /ENTRY:mainCRTStartup
copy /Y runtime\libcrypto-4-x64.dll . >nul
echo.
echo Built cufes.exe (+ libcrypto-4-x64.dll alongside).
echo Runtime prereqs on the target machine: Visual C++ Redistributable (x64) and
echo DirectML.dll (present on Windows 10 1903+). Sign cufes.exe, then ship it WITH
echo libcrypto-4-x64.dll in the same folder.

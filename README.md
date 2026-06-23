# cufes — closed Windows library + welcome shim

The entire cufes app is the **closed static library `prebuilt/cufes_ffi.lib`** (no
source). `welcome.c` is the thin source-side entry that links it. You link + **sign
your own** `cufes.exe`.

## Get the library
`cufes_ffi.lib` (~840 MB; OpenSSL statically linked in) ships as a **Release asset**
(too large for the git tree). Download the latest release's `cufes_ffi.lib` into `prebuilt/`.

## Build
From a *x64 Native Tools Command Prompt for VS* (MSVC `cl` on PATH):
```bat
build.bat            REM -> cufes.exe  (single self-contained binary)
```
`prebuilt/link.args` lists the link inputs: `cufes_ffi.lib` + the windows-rs import
libs (`windows.0.*.lib`) + Windows system libs. **OpenSSL is statically linked into
cufes_ffi.lib — there is NO libcrypto DLL to ship.**

## Runtime prerequisites on the target machine (standard, not shipped)
- **Visual C++ Redistributable (x64)** — `MSVCP140.dll` / `VCRUNTIME140*.dll`.
- **`DirectML.dll`** — present on Windows 10 1903+ (the ONNX/DirectML path).

All other dependencies are core Windows system DLLs. Verified: links with MSVC 2022,
no `libcrypto` DLL, and boots the Spark welcome surface (DX12/DirectComposition).

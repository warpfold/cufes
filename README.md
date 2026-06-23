# cufes — closed Windows library + welcome shim

The entire cufes app is the **closed static library `prebuilt/cufes_ffi.lib`** (no
source). `welcome.c` is the thin source-side entry that links it. You link + **sign
your own** `cufes.exe` — no unsigned binary is distributed.

## Get the library
`cufes_ffi.lib` (~778 MB) ships as a **Release asset** (too large for the git tree).
Download the latest release's `cufes_ffi.lib` into `prebuilt/`.

## Build
From a *x64 Native Tools Command Prompt for VS* (MSVC `cl` on PATH):
```bat
build.bat            REM -> cufes.exe (single self-contained binary, no DLLs)
```
`prebuilt/link.args` lists the exact link inputs: `cufes_ffi.lib` + the bundled
windows-rs import libs (`windows.0.*.lib`) + OpenSSL `libcrypto.lib` + the Windows
system libs. The result is a self-contained GUI binary — sign it and distribute.

Verified: links with MSVC 2022 + boots the Spark welcome surface (DX12/DirectComposition).

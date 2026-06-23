# cufes — closed Windows library + welcome shim

The entire cufes app is the **closed static library `prebuilt/cufes_ffi.lib`** (no
source). `welcome.c` is the thin source-side entry that links it. You link + **sign
your own** `cufes.exe`.

## Get the library
`cufes_ffi.lib` (~778 MB) ships as a **Release asset** (too large for the tree).
Download the latest release's `cufes_ffi.lib` into `prebuilt/`.

## Build
From a *x64 Native Tools Command Prompt for VS* (MSVC `cl` on PATH):
```bat
build.bat            REM -> cufes.exe + stages libcrypto-4-x64.dll beside it
```

## Runtime dependencies (ship these WITH cufes.exe)
The exe is **not** a single self-contained file on Windows — it dynamically links:
- **`libcrypto-4-x64.dll`** (OpenSSL, used by the encrypted SQLite store) — **shipped
  in `runtime/`** and copied next to `cufes.exe` by `build.bat`. It MUST sit beside
  the exe (or on PATH) on the target machine.
- **Visual C++ Redistributable (x64)** — `MSVCP140.dll` / `VCRUNTIME140*.dll`. Install
  the VC++ Redist on the target if missing (standard on most Windows machines).
- **`DirectML.dll`** — present on Windows 10 1903+ (used by the ONNX/DirectML path).

All other dependencies are core Windows system DLLs. Verified: links with MSVC 2022
and boots the Spark welcome surface (DX12/DirectComposition).

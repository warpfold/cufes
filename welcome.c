/* welcome — the source-side entry. The whole cufes app is the closed static
 * library `cufes_ffi.lib`; this thin shim links it and runs cufes_run(). */
#include "cufes.h"
int main(void) { cufes_run(); return 0; }

#ifndef CUFES_H
#define CUFES_H
/* The entire cufes app behind one entry. Boots + runs the product (the welcome
 * glass surface); blocks on the GUI event loop until exit. Call once from main. */
void cufes_run(void);
#endif

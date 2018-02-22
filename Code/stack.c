#include <stdio.h>

void print_frame(); //TODO split into function for printing

/* Print three stack frames, of the three callers directly above.
 */
void print_stack() {
    long rbp, rbp1;

    //Moves value in register rbp into variable rbp
    asm("movq %%rbp, %0;" : "=r"(rbp));
    //Prints value of rbp.
    printf("RBP %lx\n", rbp);
    //stores value rbp points to (previous base pointer) in rbp1
    rbp1 = *((long*) rbp);
    //Prints previous base pointer.
    printf("RBP1 %lx\n\n", rbp1);

    printf("ADDRESS,       OFFSET,  VALUE OF QUADWORD\n");
    int i = 0;

    while ((rbp1 - i) != rbp) {
        printf("%lx, -%i(%rbp), %li\n", (rbp1 - i), i,*((long*) (rbp1 - i)));
        i += 8;
    }



}

void printFrame() {
    
}

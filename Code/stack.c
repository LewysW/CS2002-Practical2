#include <stdio.h>

void print_frame(); //TODO split into function for printing

/* Print three stack frames, of the three callers directly above.
 */
void print_stack() {
    //Stores current and previous base pointer.
    long rbp, rbp1;

    //Moves value in register rbp into variable rbp
    asm("movq %%rbp, %0;" : "=r"(rbp));
    //stores value rbp points to (previous base pointer) in rbp1
    rbp1 = *((long*) rbp);

    //Calls method to print 3 stack frames
    print_frame(rbp, rbp1, 3);
}

//Prints out the address, offset and value of each quadword in the stack frame
void print_frame(long rbp, long rbp1, int frames) {
    printf("\nADDRESS,       OFFSET,  VALUE OF QUADWORD\n");
    int i = 0;

    //Repeat while the value of the address with the offset i is not equal to the current base pointer
    while ((rbp1 - i) != rbp) {
        //Prints address, offset and value of quadword
        printf("%lx, -%i(%rbp), %li\n", (rbp1 - i), i,*((long*) (rbp1 - i)));
        i += 8;
    }

    //Number of frames to print is greater than 1 then call print_frame and decrement frames.
    if (frames > 1) print_frame(rbp1, *((long*) rbp1), --frames);
}

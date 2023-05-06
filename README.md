# DateStackPackandUnpack
80x86 MASM program to handle packing and unpacking date data in the form of mm/dd/yyyy

This code demonstrates how to pack and unpack date data using the stack in 80x86 Assembly (MASM Syntax).

The packDate procedure takes in the month, day, and year as arguments and packs them into a single 32-bit value. The resulting value is then returned and can be stored in memory or used in further computations.

The unpackDate procedure takes in the packed date as an argument and unpacks it into its respective month, day, and year components. The unpacked values are then stored in an array passed as an argument.

The main program allocates an array on the stack for the unpacked date components, calls packDate with immediate arguments, saves the result, calls unpackDate with the packed date and the address of the dateComponents array, and then prints the unpacked date. Finally, the program deallocates the dateComponents array and exits.

Note that this code assumes that the month, day, and year values are valid and within the appropriate range.

Registers used in the code:

EAX: Used to hold month, day, and year values in packDate procedure, packed date value in unpackDate procedure, and to return values from procedures.

EBX: Used to hold day value in unpackDate procedure.

ECX: Used to hold month value in unpackDate procedure.

EDI: Pointer to dateComponents array in unpackDate procedure.

EBP: Base pointer register used to access function arguments and local variables on the stack.

ESP: Stack pointer register that points to the top of the stack.

# DateStackPackandUnpack

This 80x86 MASM program demonstrates how to handle packing and unpacking date data in the form of mm/dd/yyyy. It utilizes the stack for storing and retrieving the packed/unpacked date values.

## PackDate Procedure

The `PackDate` procedure takes the month, day, and year as arguments and packs them into a single 32-bit value. The packed date value is then returned and can be stored in memory or used for further computations.

## UnpackDate Procedure

The `UnpackDate` procedure takes the packed date as an argument and unpacks it into its respective month, day, and year components. The unpacked values are stored in an array passed as an argument.

## Main Program

The main program performs the following steps:

1. Allocates an array on the stack to store the unpacked date components.
2. Calls `PackDate` with immediate arguments and saves the result.
3. Calls `UnpackDate` with the packed date and the address of the dateComponents array.
4. Prints the unpacked date using the dateComponents array.
5. Deallocates the dateComponents array.
6. Exits the program.

## Usage

To run the program, assemble and link it using an appropriate MASM-compatible assembler and linker. Execute the resulting executable file to see the output displaying the packed and unpacked date values.

Please note that this code assumes that the month, day, and year values are valid and within the appropriate range.

## Registers Used

The following registers are used in the code:

- `EAX`: Used to hold month, day, and year values in `PackDate` procedure, packed date value in `UnpackDate` procedure, and to return values from procedures.
- `EBX`: Used to hold day value in `UnpackDate` procedure.
- `ECX`: Used to hold month value in `UnpackDate` procedure.
- `EDI`: Pointer to the `dateComponents` array in `UnpackDate` procedure.
- `EBP`: Base pointer register used to access function arguments and local variables on the stack.
- `ESP`: Stack pointer register that points to the top of the stack.

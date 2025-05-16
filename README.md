# hw11translate2Ascii

## Overview

`hw11translate2Ascii` reads a hard-coded array of bytes (`inputBuf`),  
translates each byte into its two-digit hexadecimal ASCII representation  
(e.g. `0x83` → `"83"`), separates them by spaces, appends a newline,  
and prints the whole string to **stdout**.

## Program Output

The program prints the contents of the inputBuf as eight two-character, uppercase hexadecimal values, each separated by a single space, with the final space replaced by a newline.
For the given data it will output exactly:

83 6A 88 DE 9A C3 54 9A

## Compilation

Make sure you have NASM and the GNU linker installed. From your source directory:

```bash
nasm -f elf64 HW11.asm
ld -o HW11 HW11.o
./HW11

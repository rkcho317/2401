;***************************************************************************************************************************
;Program name: "Array Passing Demonstration".  This program demonstrates how to pass an array of floats from a C++ function *
;to an X86 function, and back.  The X86 function makes changes to the array, and the C++ receives the array with changes    *
;included.  Copyright (C) 2018  Floyd Holliday                                                                              *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************



;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**

;Author information
;  Author name: Rosa Cho
;  Author email: rkcho317@fullerton.edu
;
;Program information
;  Program name: Array Passing Demonstration
;  Programming languages: Main function in C++; array receiving function in X86-64
;  Date program began: 2020-Jan-31
;  Date of last update: 2020-Feb-1
;  Comments reorganized:
;  Files in the program: rectangle.cpp, perimeter.asm, run.sh
;
;Purpose
;
;
;This file
;  File name: arrays-x86.asm
;  Language: X86-64
;  Syntax: Intel
;  Max page width: 172 columns
;  Optimal print specification: Landscape, 7-point font, monospace, 172 columns, 8½x11 paper
;  Assemble: nasm -f elf64 -l arrays-x86.lis -o arrays-x86.o arrays-x86.asm
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;
;Author information
;  Author name: Rosa Cho
;  Author email: rkcho317@fullerton.edu
;
;Program information
;  Program name: perimeter.asm
;  Programming languages: X86 with one module in C++
;  Date program began: 2020-Jan-1
;  Date of last update:
;
;Purpose
;  The intent of this program is to show some of the basic tools or techniques for working with basic math.
;
;Project information
;  Project files: rectangle.cpp, perimeter.asm, run.sh
;  Status: Available for public review.
;
;Translator information
;  Linux: nasm -f elf64 -l arrays-x86.lis -o arrays-x86.o arrays-x86.asm
;
;References and credits
;  Seyfarth, Chapter 10
;
;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8½x11 paper
;
;
;
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;
;===== Begin code area ====================================================================================================================================================
;%include "savedata.inc"                                     ;Not used in this program.  External macros that assist in data backup.

;%include "debug.inc"                                        ;Not now in use.  The debug tool was used during the development stages of this program.

extern printf                                               ;External C++ function for writing to standard output device

extern scanf                                                ;External C++ function for reading from the standard input device

global array_tools

;===== Declare some messages ==============================================================================================================================================
;The identifiers in this segment are quadword pointers to ascii strings stored in heap space.  They are not variables.  They are not constants.  There are no constants in
;assembly programming.  There are no variables in assembly programming: the registers assume the role of variables.

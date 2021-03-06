;***************************************************************************************************************************
;Program name: "Perimeter.asm".  This program demonstrates how to pass user-inputted floats                         *
;to an X86 function, and into a C++ main function.   Copyright (C) 2021 Rosa Cho                                                                             *
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
;  Program name: Perimeter and Average Length Calculation
;  Programming languages: Main function in C++; arithmetic, float input/output functions in X86-64
;  Date program initiated: 2021-Jan-31
;  Date last updated: 2021-Feb-12
;  Files in the program: rectangle.cpp, perimeter.asm, run.sh
;
;Purpose
;
;
;This file
;  File name: perimeter.asm
;  Language: X86-64
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm
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
;  Date program began: 2021-Jan-31
;  Date of last update: 2021-Feb-13
;
;Purpose
;  The intent of this program is to show some of the basic tools or techniques for working with basic math.
;
;Project information
;  Project files: rectangle.cpp, perimeter.asm, run.sh
;  Status: Available for public review.
;
;Translator information
;  Linux: nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm
;
;
;
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;
;===== Begin code area ====================================================================================================================================================

extern printf                                               ;External C++ function for writing to standard output device

extern scanf                                                ;External C++ function for reading from the standard input device

global perimeter_tools                                      ;Set Global perimeter_tools variables

segment .data

;===== Declare some messages ==============================================================================================================================================
initialmessage db "The X86 subprogram is now executing.", 10, 0

inputheightprompt db "Enter the height: ", 10, 0

inputwidthprompt db "Enter the weight: ", 10, 0

outputtestprompt db "Your inputs are height: %5.3lf and width: %5.3lf", 10, 0

output_peri db "The perimeter is: %5.3lf",10, 0

output_avel db "The length of the average side is: %5.3lf ", 10, 0

outputhopeprompt db "I hope you enjoyed your rectangle", 10, 0

outputsendmainprompt db "The assembly program will send the perimeter to the main function.", 10, 0

input_hfloat db "%lf",0

input_wfloat db "%lf",0

float2 dq 2.0

float4 dq 4.0

segment .bss                            ;Reserved for uninitialized data

segment .text                           ;Reserved for executing instructions.

perimeter_tools:
;==========================================================================================================================================================================
;===== Begin the application here: show how to input and output floating point numbers ====================================================================================
;==========================================================================================================================================================================

push qword 0

;====Display welcome messages====
mov rax,0
mov rdi, initialmessage
call printf
pop rax

;====Display input prompt for the height====
push qword 0
mov rax, 0
mov rdi, inputheightprompt
call printf
pop rax

;====Enter the height input===
push qword -1
mov rax, 0
mov rdi, input_hfloat
mov rsi, rsp
call scanf
movsd xmm10, [rsp]
pop rax


;====Display input prompt for the width====
push qword 0
mov rax, 0
mov rdi, inputwidthprompt
call printf
pop rax

;====Enter the width input ===
mov rax, 1
mov rdi, input_wfloat
push qword 0
mov rsi, rsp
call scanf
movsd xmm11, [rsp]
pop rax

;====Calculate Perimeter====
;Add height to width
movsd xmm12,xmm10
addsd xmm12,xmm11
mulsd xmm12,[float2]
;movsd xmm12, xmm10
;addsd xmm12, xmm10
;addsd xmm12, xmm11
;addsd xmm12, xmm11


;=====Display the Perimeter====
push qword -1
mov rax, 1
mov rdi, output_peri
movsd xmm0, xmm12
call printf
pop rax

;====Calculate average length====
movsd xmm13, xmm12
divsd xmm13, [float4]

;=====Display the average length====
push qword 0
mov rax, 1
mov rdi, output_avel
movsd xmm0, xmm13
call printf
pop rax

;===Display Goodbye messages====
push qword 0
mov rax, 0
mov rdi, outputhopeprompt
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, outputsendmainprompt
call printf
pop rax

movsd xmm0, xmm12

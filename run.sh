#!/bin/bash

#Author: Floyd Holliday
#Program name: Array Passing Demonstration

rm *.o, *.lis, *.out
echo " " #Blank line

echo "Assemble the X86 file perimeter.asm"
nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm

echo "Compile the C++ file array-main.cpp"
g++ -c -m64 -Wall -std=c++14 -o rectangle.o -fno-pie -no-pie rectangle.cpp

echo "Link the 'O' files rectangle.o and perimeter.o"
g++ -m64 -std=c++14 -fno-pie -no-pie -o peri.out rectangle.o perimeter.o

echo "Run the program Perimeter"
./peri.out

echo "This Bash script file will now terminate.  Bye."

//****************************************************************************************************************************
//Program name: "Array Passing Demonstration".  This program demonstrates how to pass an array of floats from a C++ function *
//to an X86 function, and back.  The X86 function makes changes to the array, and the C++ receives the array with changes    *
//included.  Copyright (C) 2018  Floyd Holliday                                                                              *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
//****************************************************************************************************************************




//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//Author information
//  Author name: Rosa Cho
//  Author email: rkcho317@fullerton.edu
//
//Program information
//  Program name: Array Passing Demonstration
//  Programming languages: Main function in C++; array receiving function in X86-64
//  Date program began: 2018-Feb-20
//  Date of last update: 2018-Feb-20
//  Comments reorganized: 2018-Nov-10
//  Files in the program: arrays-main.cpp, arrays-x86.asm, run.sh
//
//Purpose
//  The intent of this program is to show some of the basic techniques for managing arrays.  Some interesting actions can be seen
//  here.  You can discover where the C++ driver program stored the values 88.9 and 3.1416.  The action of returning from the X86
//  function causes the location previously holding 88.9 to change its value.
//
//This file
//  File name: arrays-main.cpp
//  Language: C++
//  Max page width: 132 columns
//  Optimal print specification: 7 point font, monospace, 132 columns, 8½x11 paper
//  Compile: g++ -c -m64 -Wall -fno-pie -no-pie -l arrays-main.lis -o arrays-main.o arrays-main.cpp
//  Link: g++ -m64 -fno-pie -no-pie -o array.out arrays-main.o arrays-x86.o
//
//Execution: ./arrays.out
//
//===== Begin code area ===================================================================================================================================================


#include <iostream>
#include <stdint.h>
#include <cstring>
#include <stdio.h>
#include <iomanip>
#include <math.h>

extern "C" double array_tools(double *, long);

int main(int argc, char* argv[]){

  printf("%s\n","Welcome to assignment 1: perimeters and averages.");
  printf("%s\n","This program will compute the perimeter and the average side length of a rectangle.");

  printf("%s\n","Have a nice day.");

} //end of main

//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6**

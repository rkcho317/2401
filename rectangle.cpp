//****************************************************************************************************************************
//Program name: "Rectangle Program".  This program demonstrates how to pass float inputs
//to an X86 function.  The X86 function makes changes to the inputs, and the C++ receives the value of the perimeter.         *
// Copyright (C) 2021 Rosa Cho                                                                            *
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
//  Program name: Rectangle
//  Programming languages: Main function in C++; arithmetic, float input/output functions in X86-64
//  Date program began: 2021-Jan-31
//  Date of last update: 2021-Feb-12
//  Comments reorganized: 2021-Feb-12
//  Files in the program: rectangle.cpp, perimeter.asm, run.sh
//
//Purpose
//  The intent of this program is to show some of the basic techniques for adding and multiplying float numbers.
//
//This file
//  File name: rectangle.cpp
//  Language: C++
//  Max page width: 67 columns
//  Optimal print specification: 7 point font, monospace, 132 columns, 8½x11 paper
//  Compile: g++ -c -m64 -Wall -std=c++14 -o rectangle.o -fno-pie -no-pie rectangle.cpp
//  Link: g++ -m64 -std=c++14 -fno-pie -no-pie -o peri.out rectangle.o perimeter.o
//
//Execution: ./peri.out
//
//===== Begin code area ===================================================================================================================================================


#include <ctime>
#include <stdint.h>
#include <cstring>
#include <stdio.h>

extern "C" double perimeter_tools();

int main(int argc, char* argv[]){
  double peri = 0.0;
  printf("%s\n","Welcome to assignment 1: perimeters and averages.");
  printf("%s\n","This program will now compute the perimeter and the average side length of a rectangle.\n");

  peri = perimeter_tools();

  printf("The main function received this number %5.3lf and has decided to keep it.  \n",peri);

  printf("%s\n", "A 0 will be returned to the operating system.");
  printf("%s\n", "Have a nice day.");

  return 0;

} //end of main

//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6**

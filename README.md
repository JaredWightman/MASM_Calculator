# Overview

This program is a very simple calculator that takes an operator and two operands and gives a result. 

I wrote it to learn more about assembly and how data is stored and allocated, as well as to have a better understanding as to what happens behind the scenes of higher-level programming languages such as C and C++.

[Software Demo Video](https://youtu.be/03wbhgr9QWM)


# Development Environment

This project was made using Visual Studio Community Edition (2022) in MASM.
The Irvine32 library (by Kip R. Irvine) was used for its pre-build console input and output functionality. 


# Useful Websites

* [MASM vs. NASM](https://www.nasm.us/doc/nasmdoc2.html#section-2.2)
* [Assembly Tutorial Playlist by Dr. Nina Javaher](https://www.youtube.com/playlist?list=PLU6DPNTD99vpzpVA7BhCo-ZGym-bDcjEj)
* [University of Virginia x86 Assembly Guide](https://www.cs.virginia.edu/~evans/cs216/guides/x86.html)
* [Irvine Library Download](https://github.com/meixinchoy/Irvine-library.git)   
I used another simple project to learn the basic concepts of MASM, with comments about what is happening on each line.
* [My Assembly Learning Project](https://github.com/JaredWightman/Assembly_Testing.git)


# Future Work

* Add the ability to be able to return to the previous answer as one of the operands
* Make division result in a floating point number rather than a quotient
* Add more math operations like factorials and exponents
* Remove the + sign on positive integer results, but keep the - sign for negative numbers
* Dynamically size operands to avoid overflow
* Add catches and bug-preventing cases
* Polish memory usage, make more efficient and clean
* Make custom input/output functions

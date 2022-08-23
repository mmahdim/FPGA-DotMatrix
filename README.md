
# FPGA-DotMatrix
 FPGA Dot Matrix Display with VHDL
 
## Introduction
 This project is a collaboration of [Mahdi Mohammadi](https://github.com/mmahdim) and [Amin Dehnavi](https://github.com/amindehnavi).
 The goal of this project is to use an FPGA to write letters on a dotmatrix display when the corresponding button on a matrix keypad is pressed.

## Hardware Description
In order to chose each column of the dotmatrix display, 74164 logic ICs are used.
Rows of the dotmatrix display are connected directly to the FPGA.
Below you can see a description of the corresponding pins.
![image](https://user-images.githubusercontent.com/8644346/186148591-8a090f29-f9e4-4b3d-8d49-32912349e7fa.png)

Here is also a schematic of the circuit.
![image](https://user-images.githubusercontent.com/8644346/186148615-fc1015af-37f3-4443-a07c-532f1919956e.png)
![image](https://user-images.githubusercontent.com/8644346/186148625-b0a8efd3-3fa3-45fb-acfe-39ba3e7bc475.png)

### 74164 IC
This IC is a shift register IC with serial input and parallel output. You can see a pinout below.
![image](https://user-images.githubusercontent.com/8644346/186148664-28e46c5b-a0b2-451a-8a44-b668b2555605.png)

Here's also a logic diagram of the IC:
![image](https://user-images.githubusercontent.com/8644346/186148682-e8c856c7-5ca5-4a52-9f9e-9902c578ad6c.png)


### 2803 IC
This IC consists of darlington pair BJTs and is used to supply the current to the dotmatrix.
![image](https://user-images.githubusercontent.com/8644346/186148734-112a892e-b55b-4e02-a183-823ac0cbaf33.png)

At last, you can see a photo of the board below:
![image](https://user-images.githubusercontent.com/8644346/186148766-ea4df18f-a2af-446c-9b68-cf09f5e57a1e.png)

## Working Principle
The user can press any of the 16 buttons on the keypad (from 0 to F), and the corresponding letter shows up on the dotmatrix.
By pressing each button, the newly entered character is entered into the leftmost dotmatrix block, and all of the other characters are shifted to the right.
By holding down a button, the corresponding letter is added into the display consistently after a timer.

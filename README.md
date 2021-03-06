# CRC (Cyclic Redundancy Check)

Data: 32 bits

G(x): x^16 + x^12 + x^5 + 1

CRC: 16 bits

Decription: 32 clock cycles used to push data through the shift register and generate the 16 bit CRC code. 
            Shift register inputs are XOR'ed at locations 0,5,12 using the final bit.
            This method generates the remainder of the division problem.

References: 

Wikipedia: Cyclic Redundancy Check

Youtube - Ben Eater: How do CRC's work?
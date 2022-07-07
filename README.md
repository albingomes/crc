# CRC (Cyclic Redundancy Check)

Data: 32 bits
G(x): x^16 + x^12 + x^5 + 1
CRC: 16 bits
T(x): Data + CRC (48 bits total)

Version 1: 32 clock cycles used to push data through the shift register and generate the 16 bit CRC code.
           RTL needs to be updated with FSM for cleaner execution.
           Data > 32 bits can be used, update required for clock cycles used to generate CRC code.

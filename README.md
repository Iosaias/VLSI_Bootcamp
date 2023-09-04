![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# Arithmetic logic unit of four operations between two 8-bit numbers

This circuit is designed to solve four arithmetic logic operations between two 8-bit numbers. 
The numbers are entered from a 4x4 matrix keyboard. The data entered from the keyboard is manipulated 
with decoders, encoders and registers, to finally reach an ALU. In the ALU one of the operations of 
addition, multiplication, xor or shift left will be calculated.

The circuit generates a two-bit counter that goes to a decoder, the decoder is 
responsible for activating the keyboard columns high. Pressing the keyboard columns 
will cause them to switch from high to low, resulting in the matrix_in input. The data 
that enter to matrix_in goes to an encoder. The encoder, according to the input, will have 
as output a hexadecimal value, which will be saved if en_reg is active. When en_reg is active, 
the data is saved at the address provided by switches 2 to 3. This address is the location where 
the data will be saved in the register bank.

The operands that enter the ALU are obtained from the register bank, the addresses of these operands 
are indicated with switches 4 to 5 and 6 to 7. To indicate the ALU operation, switches 0 to 1 are used, 
depending on the value entered, one of the following operations will be performed: 

- 00 - A + B
- 01 - A * B
- 10 - A xor B
- 11 - A << 1

Finally, the result of the operation is obtained in the 8-bit alu_r output.

# What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip!

## How to enable the GitHub actions to build the ASIC files

Please see the instructions for:

- [Enabling GitHub Actions](https://tinytapeout.com/faq/#when-i-commit-my-change-the-gds-action-isnt-running)
- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## How does it work?

When you edit the info.yaml to choose a different ID, the [GitHub Action](.github/workflows/gds.yaml) will fetch the digital netlist of your design from Wokwi.

After that, the action uses the open source ASIC tool called [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/) to build the files needed to fabricate an ASIC.


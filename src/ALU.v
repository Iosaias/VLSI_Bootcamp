`timescale 1ns / 1ps
/* ALU
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
|  00   |   ALU_Out = A + B;
----------------------------------------------------------------------
|  01   |   ALU_Out = A * B;
----------------------------------------------------------------------
|  10   |   ALU_Out = A xor B;
----------------------------------------------------------------------
|  11   |   ALU_Out = A << 1;
----------------------------------------------------------------------*/

module ALU (
    input [7:0] A,B,  // ALU 8-bit Inputs                 
    input [1:0] ALU_Sel,// ALU Selection
    output [7:0] ALU_Out, // ALU 8-bit Output
    output CarryOut, // Carry Out Flag
    output ZeroFlag // Zero Flag
    );
    
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
    wire is_zero;
    
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag

    assign is_zero = ~(|ALU_Result);
    assign ZeroFlag = is_zero;
    
    always @(*)
    begin
        case(ALU_Sel)
        2'b00: // Addition
           ALU_Result = A + B ; 
        2'b01: // Multiplication
           ALU_Result = A * B ;
        2'b10: //  Logical xor 
           ALU_Result = A ^ B;
        2'b11: // Logical shift left
           ALU_Result = A<<1;
        endcase
    end

endmodule

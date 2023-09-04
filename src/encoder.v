`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 19:17:39
// Design Name: 
// Module Name: encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module encoder ( input [3:0] keyboard,
                input clock,
                output reg [3:0] hex_out,
                input [1:0] counter
                
    );
    always@(posedge clock)
    begin

    case(counter)
    2'b00:
    case (keyboard)
    4'b1110:
    hex_out=4'h1;
    4'b1101:
    hex_out=4'h5;
    
    4'b1011:
    hex_out=4'h9;
    4'b0111:
    hex_out=4'hD;
    endcase
    
    2'b01:
    case (keyboard)
    4'b1110:
    hex_out=4'h2;
    4'b1101:
    hex_out=4'h6;
    
    4'b1011:
    hex_out=4'hA;
    4'b0111:
    hex_out=4'hE;
    endcase
    2'b10:
    case (keyboard)
    4'b1110:
    hex_out=4'h3;
    4'b1101:
    hex_out=4'h7;
    
    4'b1011:
    hex_out=4'hB;
    4'b0111:
    hex_out=4'hF;
    endcase
    
    2'b11:
    case (keyboard)
    4'b1110:
    hex_out=4'h4;
    4'b1101:
    hex_out=4'h8;
    
    4'b1011:
    hex_out=4'hC;
    4'b0111:
    hex_out=4'h0;
    endcase
    endcase
    end
endmodule

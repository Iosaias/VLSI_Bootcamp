`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2023 13:52:50
// Design Name: 
// Module Name: 2b_counter
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


module _2b_counter( input clk,
                   output reg [1:0] count

    );
    initial begin
    count=0;
    end
    always@(posedge clk)
    begin
    if(count<2'b11)
    count<=count+1;
    else
    count<=0;
    end
endmodule

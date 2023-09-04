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

module counter (
  input clk,
  output reg [1:0] count
);

  initial begin
    count = 2'b00;
  end

  always @(posedge clk) begin
    if (count < 2'b11) begin
      count = count + 1;
    end else begin
      count = 2'b00;
    end
  end

endmodule

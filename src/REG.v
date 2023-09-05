`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2021 13:41:03
// Design Name: 
// Module Name: REG
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


module REG (
    input [1:0] DIR_A, DIR_B, DIR_WR,
    input [7:0] DI,                        //Datos a guardar en registro.
    input clk, EN,                            //Reloj y reset.
    output reg [7:0] DOA, DOB                      //Salidas para la ALU
    );
    
    reg [7:0] x0,x1,x2,x3;  //Todos los registros internos disponibles.
     
    initial begin 
        x0 = 8'b00000000;
        x1 = 8'b00000000;
        x2 = 8'b00000000;
        x3 = 8'b00000000;
    end
    
    always@(posedge clk) begin

        if (EN) begin
            case(DIR_WR)                        //Address define en cuál registro se guardan los datos.
                2'b00 : x0 = DI;
                2'b01 : x1 = DI;
                2'b10 : x2 = DI;
                2'b11 : x3 = DI;
            endcase
        end
        else begin
            case(DIR_A)
                2'b00 : DOA = x0;
                2'b01 : DOA = x1;
                2'b10 : DOA = x2;
                2'b11 : DOA = x3;
            endcase
            
            case(DIR_B)
                2'b00 : DOB = x0;
                2'b01 : DOB = x1;
                2'b10 : DOB = x2;
                2'b11 : DOB = x3;
            endcase
        end
    end
endmodule

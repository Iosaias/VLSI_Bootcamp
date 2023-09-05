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
    
    reg [7:0] x[3:0];  //Todos los registros internos disponibles.
     
    initial begin 
        x[0] = 8'b00000000;
        x[1] = 8'b00000000;
        x[2] = 8'b00000000;
        x[3] = 8'b00000000;
    end
    
    always@(posedge clk) begin

        if (EN) begin
            case(DIR_WR)                        //Address define en cuál registro se guardan los datos.
                2'b00 : x[0] <= DI;
                2'b01 : x[1] <= DI;
                2'b10 : x[2] <= DI;
                2'b11 : x[3] <= DI;
            endcase
        end
        else begin
            case(DIR_A)
                2'b00 : DOA <= x[0];
                2'b01 : DOA <= x[1];
                2'b10 : DOA <= x[2];
                2'b11 : DOA <= x[3];
            endcase
            
            case(DIR_B)
                2'b00 : DOB <= x[0];
                2'b01 : DOB <= x[1];
                2'b10 : DOB <= x[2];
                2'b11 : DOB <= x[3];
            endcase
        end
    end
endmodule

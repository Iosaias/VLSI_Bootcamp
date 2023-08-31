`default_nettype none

module tt_um_seven_segment_seconds #( parameter MAX_COUNT = 24'd10_000_000 ) (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    //wire reset = ! rst_n;
    reg [7:0] ALU_Out, REG_In;
    wire [7:0] REG_A, REG_B;
    reg [1:0] addr_A, addr_B, addr_In;
    wire [3:0] ENC_In;
    reg [3:0] ENC_Out;
    wire [1:0] OP;
    wire EN, ENC_key_p, CarryOut;
    wire [1:0] count;


    // uses 4 bits input for keyboard code and 3 bits for operation
    assign ui_in[3:0] = ENC_In;
    assign ui_int[5:4] = OP;

    // assing the dedicated output to ALU Out
    assign uo_out[7:0] = ALU_Out;

    // use 7 bidirectionals as inputs and 1 as output
    assign uio_oe = 8'b10000000;

    // assign the input/output pins
    assign uio_in[5:0] = {addr_In, addr_B, addr_A};
    assign uio_in[6] = EN;
    assign uio_out[7] = zero_flag;

   

    always @(posedge clk) begin
        
        // Extends 4 bit encoder out to 8 bit by adding 0's
        REG_In <= {4'b0, ENC_Out};

    end

    _2b_counter counter(.clk(clk),
                        .count(count)
                        );

    // instantiate encoder
    encoder encoder(.keyboard(ENC_In),
                    .clock(clk),
                    .counter(count),
                    .hex_out(ENC_Out),
                    .key_p(ENC_key_p)
                    );

    // instantiate Register Bank
    REG REG(.DIR_A(addr_A),
            .DIR_B(addr_B),
            .DIR_WR(addr_In),
            .DI(REG_In),
            .clk(clk),
            .EN(EN),
            .DOA(REG_A),
            .DOB(REG_B)
            );

    ALU ALU(.A(REG_A),
            .B(REG_B),
            .ALU_Sel(OP),
            .ALU_Out(ALU_Out),
            .CarryOut(CarryOut),
            .ZeroFlag(zero_flag)
            );


endmodule

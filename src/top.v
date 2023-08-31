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
    reg [7:0] ALU_out, REG_In;
    wire [7:0] REG_A, REG_B;
    reg [1:0] addr_A, addr_B, addr_In;
    wire [3:0] ENC_In;
    reg [3:0] ENC_Out;
    wire [2:0] OP;
    wire EN, ENC_key_p;
    wire [1:0] count;


    // uses 4 bits input for keyboard code and 3 bits for operation
    assign ui_in[3:0] = ENC_In;
    assign ui_int[7:4] = OP;

    assign uo_out[7:0] = ALU_out;

    // use 7 bidirectionals as inputs and 1 as output
    assign uio_oe = 8'b10000000;

    // put bottom 8 bits of second counter out on the bidirectional gpio
    assign uio_in[5:0] = reg_address[5:0];
    assign uio_in[6] = EN;
    assign uio_out = zero_flag;

    // Extends 4 bit encoder out to 8 bit by adding 0's
    assign REG_In = {4'b0, ENC_Out};

    always @(posedge clk) begin
        
    end

    // instantiate encoder
    encoder encoder(.keyboard(ENC_In),
                    .clock(clk),
                    .counter(count),
                    .hex_out(ENC_Out),
                    .key_p(ENC_key_p)
                    );

    // instantiate Register Bank
    REG REG(.DIR_A(addr_A), .DIR_B(addr_B), .DIR_WR(addr_In),
            .DI(REG_In),
            .clk(clk),
            .EN(EN),
            .DOA(REG_A), .DOB(REG_B)
            );


endmodule

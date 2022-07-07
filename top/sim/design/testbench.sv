`timescale 1ns / 1ps
//===================================================================================
// Project      : CRC
// File name    : testbench.sv 
// Designer     : Albin Gomes
// Device       : N/A
// Description  : testbench for crc.sv 
// Limitations  : N/A
// Version      : 0.1
//===================================================================================

module testbench();

//-----------------------------------------------------------------------------------
// Nets, Regs and parameter
//-----------------------------------------------------------------------------------

parameter       TB_CLOCK_PEROIOD = 10; // 100 MHz clk = 10 ns period
logic           tb_clk;
logic           tb_reset_n;
logic           tb_enable;
logic  [31:0]   tb_data;
logic  [15:0]   tb_crc;
logic           tb_crc_done;




//-----------------------------------------------------------------------------------
// DUT
//-----------------------------------------------------------------------------------

crc crc0(
    .clk        (tb_clk),  
    .reset_n    (tb_reset_n),
    .enable     (tb_enable),
    .data       (tb_data),
    .crc        (tb_crc),
    .crc_done   (tb_crc_done)
);

//-----------------------------------------------------------------------------------
// Clocks 
//-----------------------------------------------------------------------------------

always #(TB_CLOCK_PEROIOD/2) tb_clk = !tb_clk;

//-----------------------------------------------------------------------------------
// Initialize
//-----------------------------------------------------------------------------------

initial begin
    tb_clk      <= 0;
    tb_reset_n  <= 0;
    tb_enable   <= 0;
    tb_data     <= 32'h0000_0000;
end 

//-----------------------------------------------------------------------------------
// Stimulus
//-----------------------------------------------------------------------------------

initial begin
    #(TB_CLOCK_PEROIOD*5);
    @(posedge tb_clk);
    tb_reset_n  = 1;
    tb_data     = 32'h1234_5678;
    @(posedge tb_clk);
    @(posedge tb_clk);
    tb_enable   = 1;
    wait(tb_crc_done == 1);
    tb_enable   = 0;
end






endmodule

`timescale 1ns / 1ps
//===================================================================================
// Project      : CRC
// File name    : crc.sv 
// Designer     : Albin Gomes
// Device       : N/A
// Description  : Generates 16 bit CRC code for 32 bit data
//                G(x) = x^16 + x^12 + x^5 + 1
// Limitations  : 32 clock cycles needed to generate 16 bit CRC code (cycle through 32 bit data)
//                Load data, wait 1 cycle to enable core
//                Wait atleast 2 cycles after reset is de-asserted to assert enable
// Version      : 0.1
//===================================================================================

module crc(
// input
    input           clk,   // 100 MHz: 10 ns period
    input           reset_n,
    input           enable,
    input  [31:0]   data,
// output
    output [15:0]   crc,
    output logic    crc_done
);
    
//-----------------------------------------------------------------------------------
// Nets, Regs and states
//-----------------------------------------------------------------------------------

logic [4:0]     counter;
logic [15:0]    shift_reg;
logic [47:0]    data_in;
parameter       counter_max = 31;

//-----------------------------------------------------------------------------------
// Assignment
//-----------------------------------------------------------------------------------

assign crc      = shift_reg;
assign data_in  = {data,16'h0000};

//-----------------------------------------------------------------------------------
// Processes
//-----------------------------------------------------------------------------------    

// crc computation   
always_ff @ (posedge clk) begin
    if (reset_n == 0) begin
        shift_reg   <= 0;
    end
    else begin
        if (enable == 0) begin
            shift_reg   <= data_in[47:32];
        end 
        else begin
            shift_reg[15]   <= shift_reg[14];
            shift_reg[14]   <= shift_reg[13];
            shift_reg[13]   <= shift_reg[12];
            shift_reg[12]   <= shift_reg[11] ^ shift_reg[15];
            shift_reg[11]   <= shift_reg[10];
            shift_reg[10]   <= shift_reg[9];
            shift_reg[9]    <= shift_reg[8];
            shift_reg[8]    <= shift_reg[7];
            shift_reg[7]    <= shift_reg[6];
            shift_reg[6]    <= shift_reg[5];
            shift_reg[5]    <= shift_reg[4] ^ shift_reg[15];
            shift_reg[4]    <= shift_reg[3];
            shift_reg[3]    <= shift_reg[2];
            shift_reg[2]    <= shift_reg[1];
            shift_reg[1]    <= shift_reg[0];
            shift_reg[0]    <= data_in[counter] ^ shift_reg[15];
        end  
    end 
end

// counter and crc_done
always_ff @ (posedge clk) begin 
    if (reset_n == 0) begin
        counter     <= counter_max;
        crc_done    <= 0;
    end 
    else begin
        if (enable == 0) begin
            counter     <= counter_max;
            crc_done    <= 0;
        end 
        else begin 
            counter     <= (counter == 0)? 0:counter-1;
            crc_done    <= (counter == 0)? 1:0; 
        end 
    end 
end 
    
    
endmodule

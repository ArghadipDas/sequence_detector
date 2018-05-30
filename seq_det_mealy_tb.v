`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2018 15:46:47
// Design Name: 
// Module Name: seq_detector_mealy_tb
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


module seq_detector_mealy_tb;
    reg clk;
    reg reset;
    reg ain;
    
    wire yout;
    
    seq_detector_mealy #(2'b00, 2'b01, 2'b10) DUT(.clk(clk), .reset(reset), .ain(ain), .yout(yout));
    
    initial
        begin
        clk = 0;
        reset = 0;
        ain = 0;
        end
        
    always #10 clk = ~clk;
    
    initial
    begin
        ain = 1;
        #20 ain = 1;
        #20 ain = 0;
        #20 ain = 1;
        #20 ain = 0;
        #20 ain = 1;
        #20 ain = 1;
        #2000 $finish;
    end
endmodule

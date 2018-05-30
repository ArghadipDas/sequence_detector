`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2018 15:22:13
// Design Name: 
// Module Name: seq_detector_mealy
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


module seq_detector_mealy(
    input clk,
    input reset,
    input ain,
    output reg yout
    );
    
    reg state, nextstate;
    parameter S0 = 2'b00 , S1 = 2'b01 , S2 = 2'b10 ;
    
    always @(posedge clk or posedge reset)
        if (reset)
            state = S0;
        else state = nextstate;
        
    always @(state or ain)
        begin
            yout = 1'b0;
            case (state)
                S0: 
                    yout = 0;
                S1: 
                    yout = 0;
                S2: if(ain)
                        yout = 1;
                    else
                        yout = 0;
            endcase
        end
        
    always @(state or ain)
        begin
            nextstate = S0;
            case(state)
                S0: if(ain)
                        nextstate = S1;
                    else 
                        nextstate = S0;
                S1: if(ain)
                        nextstate = S2;
                    else 
                        nextstate = S1;
                S2: if(ain)
                        nextstate = S0;
                    else 
                        nextstate = S2;
            endcase
       end
       
       
endmodule

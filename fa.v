//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 03:03:07 PM
// Design Name: 
// Module Name: fa
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
//full adder
module fa(a, b, c,s, c_out);
input a,b,c;
output s,c_out;
ha first(a,b,c1,s1);
ha second(s1,c,c2,s2);
assign s=s2;
assign c_out= c1 | c2;
endmodule

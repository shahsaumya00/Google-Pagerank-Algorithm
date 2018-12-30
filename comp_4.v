//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 03:06:42 PM
// Design Name: 
// Module Name: comp_4
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

//4 bit comparator
module comp4(a,b,l,g,eq);
input [3:0] a;
input [3:0] b;
output l,g,eq;
comp_2 f_4(a[1:0], b[1:0],lt0,gt0, equ0);
comp_2 s_4(a[3:2], b[3:2],lt1,gt1, equ1);
assign l=(lt0 | lt1) && (~gt1);
assign g=(gt0 | gt1) && (~lt1);
assign eq=equ0 && equ1;
endmodule

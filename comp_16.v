//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 03:08:16 PM
// Design Name: 
// Module Name: comp_16
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


module comp16(a,b,l,g,eq);
input [15:0] a;
input [15:0] b;
output l,g,eq;
comp8 f_16(a[7:0], b[7:0],lt0,gt0, equ0);
comp8 s_16(a[15:8], b[15:8],lt1,gt1, equ1);
assign l=(lt0 | lt1) && (~gt1);
assign g=(gt0 | gt1) && (~lt1);
assign eq=equ0 && equ1;
endmodule
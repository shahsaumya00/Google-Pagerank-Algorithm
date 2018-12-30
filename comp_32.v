//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 03:09:02 PM
// Design Name: 
// Module Name: comp_32
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

/*32 bit comparator
  Compares a and b
  if a>b l=0,g=1,eq=0
  if a<b l=1,g=0,eq=0
  if a=b l=0,g=0,eq=1
  */
module Comparator(a,b,l,g,eq);
input [31:0] a;
input [31:0] b;
output l,g,eq;
comp16 f_32(a[15:0], b[15:0],lt0,gt0, equ0);
comp16 s_32(a[31:16], b[31:16],lt1,gt1, equ1);
assign l=(lt0 | lt1) && (~gt1);
assign g=(gt0 | gt1) && (~lt1);
assign eq=equ0 && equ1;
endmodule

//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 03:07:31 PM
// Design Name: 
// Module Name: comp_8
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

/*8 bit comparator*/
module comp8(a,b,l,g,eq);
input [7:0] a;
input [7:0] b;
output l,g,eq;
comp4 f_8(a[3:0], b[3:0],lt0,gt0, equ0);
comp4 s_8(a[7:4], b[7:4],lt1,gt1, equ1);
assign l=(lt0 | lt1) && (~gt1);
assign g=(gt0 | gt1) && (~lt1);
assign eq=equ0 && equ1;
endmodule
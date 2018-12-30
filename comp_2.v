//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 03:05:47 PM
// Design Name: 
// Module Name: comp_2
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

//2 bit comparator
module comp_2(a,b,l,g,eq);
input [1:0] a;
input [1:0] b;
output l,g,eq;
assign lt1= (~a[1])&&b[1];
assign lt2= (~a[0]) && (~a[1]) && b[0];
assign lt3= (~a[0])&& b[1] && b[0];
assign l= lt1 | lt2 | lt3;
assign gt1=a[0] && (~b[1]) && (~b[0]);
assign gt2= a[1] && (~b[1]);
assign gt3= a[0] && a[1] && (~b[0]);
assign g= gt1 | gt2 | gt3;
assign e1=a[0]&&b[0];
assign e2=(~a[0])&&(~b[0]);
assign eq1=e1 | e2;
assign e3= a[1] && b[1];
assign e4= (~a[1]) && (~b[1]);
assign eq2= e3 | e4;
assign eq= eq1 && eq2;
endmodule

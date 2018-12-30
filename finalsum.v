//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 03:21:05 PM
// Design Name: 
// Module Name: finalsum
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

//Module adds all the partial pageranks in logn steps.
module sum_logn(initial_sum
	partial_pagerank_0,
	partial_pagerank_1,
	partial_pagerank_2,
	partial_pagerank_3,
	partial_pagerank_4,
	partial_pagerank_5,
	partial_pagerank_6,
	partial_pagerank_7,
	partial_pagerank_8,
	partial_pagerank_9,
	sum_pagerank);

input [31:0] initial_sum;
input [31:0] partial_pagerank_0,partial_pagerank_1,partial_pagerank_2,partial_pagerank_3,partial_pagerank_4,partial_pagerank_5,partial_pagerank_6,partial_pagerank_7,partial_pagerank_8,partial_pagerank_9;
output [31:0] sum_pagerank;

wire [31:0] add_01,add_23,add_45,add_67,add_1,add_2,add_3,add_4,add_89;

Adder_32 m_add01(partial_pagerank_0,partial_pagerank_1,0,add_01,carry);
Adder_32 m_add23(partial_pagerank_2,partial_pagerank_3,0,add_23,carry);
Adder_32 m_add45(partial_pagerank_4,partial_pagerank_5,0,add_45,carry);
Adder_32 m_add67(partial_pagerank_6,partial_pagerank_7,0,add_67,carry);
Adder_32 m_add89(partial_pagerank_8,partial_pagerank_9,0,add_89,carry);
Adder_32 m_add1(add_01,add_23,0,add_1,carry);
Adder_32 m_add2(add_45,add_67,0,add_2,carry);
Adder_32 m_add3(add_1,add_2,0,add_3,carry);
Adder_32 m_add4(add_3,add_89,0,add_4,carry);
Adder_32 m_final(add_4,initial_sum,0,sum,carry)

assign sum_pagerank = sum;

endmodule

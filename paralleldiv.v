//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 03:22:14 PM
// Design Name: 
// Module Name: paralleldiv
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
//Module divides pagerank by outdegree parallely and then calls sum module to add them up. 
module parrallel_divison(page_rank_bram,out_deg_bram,ip_count,clk,reset,final_pagerank,done_parrallel_division);

input [31:0]  page_rank_bram;
input [31:0]  out_deg_bram;
input clk;
input reset;
input [3:0] ip_count;
input [31:0] initial_sum;
output reg [31:0] final_pagerank;
output reg [0:0] done_parrallel_division=0;

wire [3:0] i=4'b0;
wire [31:0] partial_pagerank_0,partial_pagerank_1,partial_pagerank_2,partial_pagerank_3,partial_pagerank_4,partial_pagerank_5,partial_pagerank_6,partial_pagerank_7,partial_pagerank_8,partial_pagerank_9;
wire [9:0] done;
wire [31:0] sum_pagerank;

reg [3:0] count=0;
reg [9:0] enable=10'b0;
reg [31:0] page_rank_0,page_rank_1,page_rank_2,page_rank_3,page_rank_4,page_rank_5,page_rank_6,page_rank_7,page_rank_8,page_rank_9;
reg [31:0] out_deg_0,out_deg_1,out_deg_2,out_deg_3,out_deg_4,out_deg_5,out_deg_6,out_deg_7,out_deg_8,out_deg_9;

divison div_0(page_rank_0,out_deg_0,clk,reset,enable[0],partial_pagerank_0,done[0]);
divison div_1(page_rank_1,out_deg_1,clk,reset,enable[1],partial_pagerank_1,done[1]);
divison div_2(page_rank_2,out_deg_2,clk,reset,enable[2],partial_pagerank_2,done[2]);
divison div_3(page_rank_3,out_deg_3,clk,reset,enable[3],partial_pagerank_3,done[3]);
divison div_4(page_rank_4,out_deg_4,clk,reset,enable[4],partial_pagerank_4,done[4]);
divison div_5(page_rank_5,out_deg_5,clk,reset,enable[5],partial_pagerank_5,done[5]);
divison div_6(page_rank_6,out_deg_6,clk,reset,enable[6],partial_pagerank_6,done[6]);
divison div_7(page_rank_7,out_deg_7,clk,reset,enable[7],partial_pagerank_7,done[7]);
divison div_8(page_rank_8,out_deg_8,clk,reset,enable[8],partial_pagerank_8,done[8]);
divison div_9(page_rank_9,out_deg_9,clk,reset,enable[9],partial_pagerank_9,done[9]);

sum_logn sum(initial_sum,partial_pagerank_0,partial_pagerank_1,partial_pagerank_2,partial_pagerank_3,partial_pagerank_4,partial_pagerank_5,partial_pagerank_6,partial_pagerank_7,partial_pagerank_8,partial_pagerank_9,sum_pagerank);


always @(posedge clk)
begin
if(reset==1)
begin
	if(count<ip_count)
	begin				
		case(count)
		0:begin
			page_rank_0<=page_rank_bram;
			out_deg_0<=out_deg_bram;
			enable[0]<=1'b1;
			count<=count+1;
		end
		1:begin
			page_rank_1<=page_rank_bram;
			out_deg_1<=out_deg_bram;
			enable[1]<=1'b1;
			count<=count+1;
		end
		2:begin
			page_rank_2<=page_rank_bram;
			out_deg_2<=out_deg_bram;
			enable[2]<=1'b1;
			count<=count+1;
		end
		3:begin
			page_rank_3<=page_rank_bram;
			out_deg_3<=out_deg_bram;
			enable[3]<=1'b1;
			count<=count+1;
		end
		4:begin
			page_rank_4<=page_rank_bram;
			out_deg_4<=out_deg_bram;
			enable[4]<=1'b1;
			count<=count+1;
		end
		5:begin
			page_rank_5<=page_rank_bram;
			out_deg_5<=out_deg_bram;
			enable[5]<=1'b1;
			count<=count+1;
		end
		6:begin
			page_rank_6<=page_rank_bram;
			out_deg_6<=out_deg_bram;
			enable[6]<=1'b1;
			count<=count+1;
		end
		7:begin
			page_rank_7<=page_rank_bram;
			out_deg_7<=out_deg_bram;
			enable[7]<=1'b1;
			count<=count+1;
		end
		8:begin
			page_rank_8<=page_rank_bram;
			out_deg_8<=out_deg_bram;
			enable[8]<=1'b1;
			count<=count+1;
		end
		9:begin
			page_rank_9<=page_rank_bram;
			out_deg_9<=out_deg_bram;
			enable[9]<=1'b1;
			count<=count+1;
		end
	endcase
	end

	if(enable[9:0]==done[9:0])
	begin
		done_parrallel_division=1;
		final_pagerank<=sum_pagerank;			
	end

end
end

endmodule
//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 03:23:46 PM
// Design Name: 
// Module Name: Topmodule
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


module fetch_bram(index,busy,busy1,busy2,module_valid,module_ready,bram1_output,bram2_output,ipfifo_valid,opfifo_ready,wr_fifocount,rd_fifocount,fifocount,wr1_fifocount,rd1_fifocount,fifocount1,clk,reset,addr,dout_bram1,dout_bram2,en,we,we_bram3,addr_bram3,din_final_pagerank);

input clk;
input reset;
input [63:0] index;

output reg [31:0] bram1_output;
output reg [31:0] bram2_output;
input  busy;
input  busy2;
input  busy1;

output reg [31:0] addr;
output reg [31:0] din_final_pagerank;

output  module_valid;
output reg module_ready;
input ipfifo_valid;

input [31:0] opfifo_ready;
input [31:0] wr_fifocount;
input [31:0] rd_fifocount;
input [31:0] fifocount;
input [31:0] wr1_fifocount;
input [31:0] rd1_fifocount;
input [31:0] fifocount1;

input [31:0] dout_bram1;
input [31:0] dout_bram2;
output [0:0] en;
output reg [3:0] we=4'b1;
output reg [3:0] we_bram3=4'b0;
output [31:0] addr_bram3;

reg [31:0] dout_pagerank;
reg [31:0] dout_outdeg;
reg [31:0] intial_sum=0
reg [7:0] ip_count;
reg [4:0] send_count;
reg [4:0] module_count=4'b0;
reg [4:0] quotient;   //max=255/10 i.e 26 so we need only 5 bits
wire [31:0] final_pagerank;
reg [31:0] done_sum;
reg flag;
parrallel_divison par_div(dout_pagerank,dout_outdeg,send_count,intial_sum,clk,reset,final_pagerank,done);

always @(posedge clk)
begin
if(reset==1)
begin
    if(we==4'b1 && ipfifo_valid==1)
    begin
        if(index[63:62]==2'b00)
        begin
        	bram1_output<=index[31:0];
        end
        if(index[63:62]==2'b01)
        begin
            bram2_output<=index[31:0];
        end
        if(index[63:62]==2'b11)
        begin
           we<=4'b0; 
        end
    end
	if(ipfifo_valid==1 && module_ready==1 && flag==1 && we!=4'b1)
	begin
	    flag<=0;
		ip_count=index[63:32]-index[31:0];
		quotient=ip_count/10;		//cycles needed=quotient+1;
		dout_pagerank<=dout_bram1;
		dout_outdeg<=dout_bram2;
		addr<=addr+1;
		if(module_count!=quotient)
		begin
			send_count=10;
			done_sum[module_count]<=done;
			if(done_sum[module_count]==1)
			begin
				intial_sum<=final_pagerank;
				module_count<=module_count+1;
			end				
		end
		if(module_count==quotient)
		begin
			send_count=quotient%10;
			done_sum[module1_count]<=done;
			if(done_sum[module_count]==1)
			begin
				intial_sum<=final_pagerank;
				module_count<=module_count+1;
			end
		end
		module_ready<=1;
	end
end
end

endmodule

/*if(done_sum==1)
			begin
            	if(opfifo_ready==1)
            	begin
			    	din_final_pagerank<=final_pagerank;
			    	flag<=1;
			    	we_bram3<=4'b1;
				end
			end*/
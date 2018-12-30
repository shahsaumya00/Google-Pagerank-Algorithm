module parallel_division_tb;
//module parrallel_divison(page_rank_bram,out_deg_bram,ip_count,clk,reset,final_pagerank[31:0],done_sum);
reg [31:0] page_rank_bram;
reg [31:0] out_deg_bram;
reg [3:0] ip_count;
reg clk;
reg reset;
wire [31:0] final_pagerank;
//wire [0:0] done_sum;

parrallel_divison DUT(.page_rank_bram(page_rank_bram),.out_deg_bram(out_deg_bram),.ip_count(ip_count),.clk(clk),.reset(reset),.final_pagerank(final_pagerank),.done_parrallel_division(done_parrallel_division));

initial begin
	clk=1'b0;
	reset=1'b1;
	ip_count=4'b111;
	page_rank_bram=32'b11110101010100;
	out_deg_bram=32'b1011;
	$display(page_rank_bram);
	$display(out_deg_bram);
	#2
	
	page_rank_bram=32'b11010101010101010;
	out_deg_bram=32'b10111;
	$display(page_rank_bram);
	$display(out_deg_bram);
	#2
	page_rank_bram=32'b100101010011111;
	out_deg_bram=32'b1101101;
	$display(page_rank_bram);
	$display(out_deg_bram);
	#2
	page_rank_bram=32'b1011000111000011;
	out_deg_bram=32'b101100101;
	$display(page_rank_bram);
	$display(out_deg_bram);
	#2
	page_rank_bram=32'b1011111110011;
	out_deg_bram=32'b1101;
	$display(page_rank_bram);
	$display(out_deg_bram);
	#2
	page_rank_bram=32'b101111111011100011;
	out_deg_bram=32'b101111101;
	$display(page_rank_bram);
	$display(out_deg_bram);
	#2
	page_rank_bram=32'b10111111101;
	out_deg_bram=32'b101001;
	$display(page_rank_bram);
	$display(out_deg_bram);
	#10000;
	$display("final_pagerank=%d",final_pagerank);
	$display("done=%d",done_parrallel_division);
	$finish;
end 

always #1 clk=~clk;

endmodule
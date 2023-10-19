`timescale  1ns / 1ps
`include "multi_sel.v"
module tb_multi_sel;
// multi_sel Parameters
parameter PERIOD  = 10;


// multi_sel Inputs
reg   [7:0]  d                     = 0 ;
reg   clk                          = 0 ;
reg   rst                          = 0 ;

// multi_sel Outputs
wire  input_grant                          ;    
wire  [10:0]  out                          ;    


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst  =  1;
end

multi_sel  u_multi_sel (
    .d                       ( d            [7:0]  ),
    .clk                     ( clk                 ),
    .rst                     ( rst                 ),

    .input_grant             ( input_grant         ),
    .out                     ( out          [10:0] )
);

initial
begin
#14 d=8'd5;
#70 d=8'd7;
#80 d=8'd6;
#100 d=8'd1;
#200 $finish;
end

initial begin
$dumpfile("tb_multi_sel1.vcd");
$dumpvars(0, tb_multi_sel);
end

endmodule





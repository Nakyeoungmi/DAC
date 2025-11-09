`timescale 1ns / 1ps

module tb_DAC;
    reg clk, rst;
    reg [5:0] btn;
    reg add_sel;
    wire dac_csn, dac_ldacn, dac_wrn, dac_a_b;
    wire [7:0] dac_d;
    wire [7:0] led_out;

    DAC uut (
        .clk(clk),
        .rst(rst),
        .btn(btn),
        .add_sel(add_sel),
        .dac_csn(dac_csn),
        .dac_ldacn(dac_ldacn),
        .dac_wrn(dac_wrn),
        .dac_a_b(dac_a_b),
        .dac_d(dac_d),
        .led_out(led_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("DAC_tb.vcd");
        $dumpvars(0, tb_DAC);

      
        clk = 0;
        rst = 0;
        btn = 6'b000000;
        add_sel = 0;

        #20 rst = 1;

        // 버튼 1 (감소)
        #50 btn = 6'b100000;  // 버튼1
        #20 btn = 6'b000000;

        // 버튼 3 (증가)
        #100 btn = 6'b010000; // 버튼3
        #20 btn = 6'b000000;

        // 버튼 4 (감소)
        #100 btn = 6'b001000;
        #20 btn = 6'b000000;

        // 버튼 6 (증가)
        #100 btn = 6'b000100;
        #20 btn = 6'b000000;

        // 버튼 7 (감소)
        #100 btn = 6'b000010;
        #20 btn = 6'b000000;

        // 버튼 9 (증가) 
        #100 btn = 6'b000001;
        #20 btn = 6'b000000;

  
        #500 $finish;
    end
endmodule

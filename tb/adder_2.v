module adder_2(
    input  wire signed [7:0] a,
    input  wire signed [7:0] b,
    output wire signed [8:0] sum
);

    assign sum = a + b;

endmodule

module adder_2_tb;
    reg signed [7:0] a;
    reg signed [7:0] b;
    wire signed [8:0] sum;

    adder_2 uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        $dumpfile("adder_2_tb.vcd");
        $dumpvars(0, adder_2_tb);

        a = 8'sd0; b = 8'sd0;
        #10;
        a = 8'sd15; b = 8'sd10;
        #10;
        a = -8'sd20; b = 8'sd5;
        #10;
        a = -8'sd100; b = -8'sd50;
        #10;

        $display("a=%0d b=%0d sum=%0d", a, b, sum);
        $finish;
    end

    initial begin
        $monitor("%0t a=%0d b=%0d sum=%0d", $time, a, b, sum);
    end
endmodule

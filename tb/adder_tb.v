module adder_tb;
reg signed [7:0] a;
    reg signed [7:0] b;
    wire signed [8:0] sum;

    adder uut (
        .a(a),
        .b(b),
        .y(sum)
    );

    initial begin
        $dumpfile("adder_tb.vcd");
        $dumpvars(0, adder_tb);

        a = 8'sd0; b = 8'sd0; y=9'sd0;
        if (y!=sum) $fatal(0,"error 1");
        #10;
        a = 8'sd15; b = 8'sd10; y=9'sd25;
        if (y!=sum) $fatal(0,"error 2");
        #10;
        a = -8'sd20; b = 8'sd5; y=9'sd25;
        if (y!=sum) $fatal(0,"error 3");
        #10;
        a = -8'sd100; b = -8'sd50; y=9'sd25;
        if (y!=sum) $fatal(0,"error 4");
        #10;

        $display("a=%0d b=%0d sum=%0d", a, b, sum, y);
        $finish;
    end

    initial begin
        $monitor("%0t a=%0d b=%0d sum=%0d", $time, a, b, sum);
    end
endmodule


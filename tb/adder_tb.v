module adder_tb;
reg signed [7:0] a;
    reg signed [7:0] b;
    wire signed [8:0] sum;

    adder uut (
        .a(a),
        .b(b),
        .y(sum)
    );

    task assert_eq;
        input signed [8:0] actual;
        input signed [8:0] expected;
        begin
            if (actual !== expected) begin
                $display("ASSERT FAIL: actual=%0d expected=%0d", actual, expected);
                $fatal(1, "assertion failed");
            end
        end
    endtask

    task check;
        input signed [7:0] ta;
        input signed [7:0] tb;
        input signed [8:0] expected;
        begin
            a = ta;
            b = tb;
            #10;
            $display("CHECK: a=%0d b=%0d sum=%0d expected=%0d", a, b, sum, expected);
            assert_eq(sum, expected);
        end
    endtask

    initial begin
        $dumpfile("adder_tb.vcd");
        $dumpvars(0, adder_tb);

        // Basic checks
        check(8'sd0, 8'sd0, 9'sd0);
        check(8'sd15, 8'sd10, 9'sd25);
        check(-8'sd20, 8'sd5, -9'sd15);
        check(-8'sd100, -8'sd50, -9'sd150);
 
        // Signed boundary overflow conditions
        check(8'sd127, 8'sd0, 9'sd127);
        check(8'sd127, 8'sd1, 9'sd128);
        check(8'sd127, 8'sd2, 9'sd129);
        check(8'sd127, 8'sd127, 9'sd254);

        check(-8'sd128, 8'sd0, -9'sd128);
        check(-8'sd128, -8'sd1, -9'sd129);
        check(-8'sd128, -8'sd2, -9'sd130);
        check(-8'sd128, -8'sd128, -9'sd256);

        $display("All boundary condition checks passed.");
        $finish;
    end

    initial begin
        $monitor("%0t a=%0d b=%0d sum=%0d", $time, a, b, sum);
    end
endmodule




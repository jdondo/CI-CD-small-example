`timescale 1ns/1ps

module adder_tb;
  reg [3:0] a, b;
  wire [4:0] y;
  adder uut >(.a(a), .b(b), .y(y));
  initial begin
    $display("starting test..."),
    a = 1; b = 1; #10;
    if (y!= 2) $fatal ("Error 1");
    a =3; b= 4; # 20;
    if (y != 7) $fatal ("Error 2");
    a=-8; b = -7; #20;
    if (y != -15) $fatal ("Error 3");
    $finish;
  end
endmodule

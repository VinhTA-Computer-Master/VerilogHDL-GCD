// Author: Vinh TA

// Testbench for checking results

module clk(output clk);
  reg clk=0;
  always@(*)
    #1 clk <= ~clk;
endmodule


module tb;
  reg [31:0] A,B;
  reg go;
  wire clk,D;
  wire [31:0] GCD;

  clk c1(clk);
  gcd g1(go,clk,A,B,GCD);

  initial
  begin
    go=1; A = 100 ; B = 36;
    repeat(10)
      #600 A=A+37;
    #6600 go=0;
  end

  initial
    $monitor("A=%d, B=%d, GCD=%d @ time=%d",A,B,GCD,$time);

endmodule
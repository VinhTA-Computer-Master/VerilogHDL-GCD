/* Description: A greatest common divisor built by control unit and datapath.
 * Author: Vinh TA
 */


// Integrating previously built control unit and datapath (funtional units)

module gcd(input go,clk, input [31:0] X,Y, output[31:0] GCD);

  wire Xs,Ys,Xld,Yld,Dld,clk;
  wire D;
  wire GCD;
  wire [3:0] S;

  datapath d1(X,Y,S,Xs,Ys,Xld,Yld,Dld,clk,GCD,D);
  control c1(go,D,clk,Xs,Ys,Xld,Yld,Dld,S);

endmodule

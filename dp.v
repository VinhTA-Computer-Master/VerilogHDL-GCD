// Author: Vinh TA

// Creating functional units (ALU and other registers, MUX)

module DFF(input [31:0] A, input EN, clk, output [31:0] D);
  reg [31:0] D;
  wire clk;
  
  always@(posedge clk)
    if(EN)
      D<=A;
    else
      D<=D;
endmodule


module MUX32(input [31:0] A,B, input S, output [31:0] Y);
  wire [31:0] Y;
  assign Y = S?B:A;
endmodule


module datapath
(input [31:0] Xi,Yi, input [3:0] S, input Xs,Ys,Xld,Yld,Dld,clk, output [31:0] D_o,output D_c);

  wire clk,Cout,D_c;
  wire [31:0] D,X,Y,XD,YD,D_o;
  reg Cin=0;

  assign D_c = D[0];
  MUX32 mx(Xi,D,Xs,X);
  MUX32 my(Yi,D,Ys,Y);
  DFF dx(X,Xld,clk,XD);
  DFF dy(Y,Yld,clk,YD);
  alu a(XD,YD,S,Cin,D,Cout);
  DFF Dd(XD,Dld,clk,D_o);

endmodule
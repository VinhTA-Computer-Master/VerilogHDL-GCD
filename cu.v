// Author: Vinh TA

// A control unit (FSM) for GCD model 

module control
(input go,D,clk, output Xs,Ys,Xld,Yld,Dld, output [3:0] S);

  wire Xs,Ys,Xld,Yld,Dld,clk;
  reg [3:0] Q=4'b0000;
  reg [4:0] out;  // out={Xs,Ys,Xld,Yld,Dld}
  assign Xs = out[4];
  assign Ys = out[3];
  assign Xld = out[2];
  assign Yld = out[1];
  assign Dld = out[0];
  reg [3:0] QN,S;

  always@(*)
  case(Q)
    4'b0000: if(go) QN = 4'b0010;
    	      else QN = 4'b0001;
    4'b0001: $finish;
    4'b0010: 
      begin
        QN = 4'b0011;
	out = 5'b00110;
      end
    4'b0011: 
      begin
        S = 4'b1111;
	out = 5'b00000;
	if(!D) QN = 4'b1001;
        else QN = 4'b0100;
      end
    4'b0100:
      begin
        S = 4'b1110;
	out = 5'b00000;
	if(!D) QN = 4'b0101;
        else QN = 4'b0110;
      end
    4'b0101:
      begin
        out = 5'b10100;
        S = 4'b0010;
	QN = 4'b0111;
      end
    4'b0110:
      begin
        out = 5'b01010;
        S = 4'b0010;
        QN = 4'b0111;
      end
    4'b0111: 
      begin
        QN = 4'b1000;
        S = 4'b0000; out = 5'b00000;
      end
    4'b1000: QN = 4'b0011;
    4'b1001: 
      begin
        out = 5'b00001;
        QN = 4'b1010;
      end
    4'b1010: QN = 4'b0000;
  endcase

  always@(posedge clk)
    Q<=QN;

endmodule
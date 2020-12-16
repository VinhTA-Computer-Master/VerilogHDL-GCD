module alu
(input [31:0] A, B, input [3:0] S, input Cin, output [31:0] D, output Cout);

  reg [31:0] D;
  reg Cout=0;
  
  always@(*)
  case(S)
    4'b0000: ;
    4'b0001: {Cout,D} = A+B+Cin;
    4'b0010:   // modified for GCD!
      if(D)
        D = B-A;
      else
        D = A-B;
    4'b0011: D = A*B;
    4'b0100: D = A/B;
    4'b0101: begin 
      D[31:1] = A[30:0]; D[0] = 0;
      end
    4'b0110: begin
      D[30:0] = A[31:1]; D[31] =0;
      end
    4'b0111: begin
      D[31:1] = A[30:0]; D[0] = A[31];
      end
    4'b1000: begin
      D[30:0] = A[31:1]; D[31] = A[0];
      end
    4'b1001: D = A&B;
    4'b1010: D = A|B;
    4'b1011: D = A^B;
    4'b1100: D = ~(A&B);
    4'b1101: D = ~(A|B);
    4'b1110: D = (A<B)?1:0;
    4'b1111: D = (A!=B)?1:0;
  endcase

endmodule  
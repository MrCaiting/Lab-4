module carry_lookahead_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* Code for Carry Lookahead Adder */
      logic [4:0] C;
      logic [3:0] G, P;

      always_comb begin
        C[0] = 1'b0;
        for(int i = 1 ; i<5; i=i+1) begin
          C[i] = G[i-1] | (P[i-1] & C[i-1]);  // Based on the equation given in lab manual 4.4
        end
        CO = C[4];
      end

      four_bit_ra FRA0(.x(A[3:0]), .y(B[3:0]), .cin(0), .s(Sum[3:0]), .g_4(G[0]), .p_4(P[0]));
      four_bit_ra FRA1(.x(A[7:4]), .y(B[7:4]), .cin(C[1]), .s(Sum[7:4]), .g_4(G[1]), .p_4(P[1]));
      four_bit_ra FRA2(.x(A[11:8]), .y(B[11:8]), .cin(C[2]), .s(Sum[11:8]), .g_4(G[2]), .p_4(P[2]));
      four_bit_ra FRA3(.x(A[15:12]), .y(B[15:12]), .cin(C[3]), .s(Sum[15:12]), .g_4(G[3]), .p_4(P[3]));


endmodule


module four_bit_ra(
                       input [3:0] x,
                       input [3:0] y,
                       input cin,
                       output logic [3:0] s,
                       output logic g_4,
							         output logic p_4
                       );

  logic [3:0] C;
  logic [3:0] G, P;

  always_comb begin
    for(int i = 0 ; i<4; i=i+1) begin
      G[i] = x[i] & y[i];
      P[i] = x[i] ^ y[i];
    end
    C[0] = cin;
    for(int i = 1 ; i<4; i=i+1) begin
      C[i] = G[i-1] | (P[i-1] & C[i-1]);  // Based on the equation given in lab manual 4.4
    end
  end

         full_adder fa0(.x(x[0]), .y(y[0]), .cin(C[0]), .s(s[0]));
         full_adder fa1(.x(x[1]), .y(y[1]), .cin(C[1]), .s(s[1]));
         full_adder fa2(.x(x[2]), .y(y[2]), .cin(C[2]), .s(s[2]));
         full_adder fa3(.x(x[3]), .y(y[3]), .cin(C[3]), .s(s[3]));
    always_comb begin
      g_4 = G[3];
      p_4 = P[3];
    end
endmodule

module full_adder(
                      input x,
                      input y,
                      input cin,
                      output logic s);
   assign s = x ^ y ^ cin;
endmodule

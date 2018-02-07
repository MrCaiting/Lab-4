module carry_select_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a carry select.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */

         logic C4, C8, C12, Cout;

      first_four_bit_csa FRA0(.x(A[3:0]), .y(B[3:0]), .cin(0), .s(Sum[3:0]), .cout(C4));
      four_bit_csa FRA1(.x(A[7:4]), .y(B[7:4]), .cin(C4), .s(Sum[7:4]), .cout(C8));
      four_bit_csa FRA2(.x(A[11:8]), .y(B[11:8]), .cin(C8), .s(Sum[11:8]), .cout(C12));
      four_bit_csa FRA3(.x(A[15:12]), .y(B[15:12]), .cin(C12), .s(Sum[15:12]), .cout(Cout));
            assign CO = Cout;

endmodule


module first_four_bit_csa(
                       input [3:0] x,
                       input [3:0] y,
                       input cin,
                       output logic [3:0] s,
                       output logic cout
                       );
                                             logic c0, c1, c2;

                          full_adder_csa fa0(.x(x[0]), .y(y[0]), .cin(cin), .s(s[0]), .cout(c0));
                          full_adder_csa fa1(.x(x[1]), .y(y[1]), .cin(c0), .s(s[1]), .cout(c1));
                          full_adder_csa fa2(.x(x[2]), .y(y[2]), .cin(c1), .s(s[2]), .cout(c2));
                          full_adder_csa fa3(.x(x[3]), .y(y[3]), .cin(c2), .s(s[3]), .cout(cout));


     endmodule




module four_bit_csa(
                       input [3:0] x,
                       input [3:0] y,
                       input cin,
                       output logic [3:0] s,
                       output logic cout
                       );

  logic c00, c01, c10, c11, c20, c21, cout0, cout1;
    logic [3:0] s0, s1;

         full_adder_csa fa0(.x(x[0]), .y(y[0]), .cin(0), . s(s0[0]), .cout(c00));
         full_adder_csa fa1(.x(x[1]), .y(y[1]), .cin(c00), .s(s0[1]), .cout(c10));
         full_adder_csa fa2(.x(x[2]), .y(y[2]), .cin(c10), .s(s0[2]), .cout(c20));
         full_adder_csa fa3(.x(x[3]), .y(y[3]), .cin(c20), .s(s0[3]), .cout(cout0));

            full_adder_csa fa0s(.x(x[0]), .y(y[0]), .cin(1), . s(s1[0]), .cout(c01));
             full_adder_csa fa1s(.x(x[1]), .y(y[1]), .cin(c01), .s(s1[1]), .cout(c11));
             full_adder_csa fa2s(.x(x[2]), .y(y[2]), .cin(c11), .s(s1[2]), .cout(c21));
             full_adder_csa fa3s(.x(x[3]), .y(y[3]), .cin(c21), .s(s1[3]), .cout(cout1));

       assign cout = (cin & cout1) | cout0;

      always_comb
            begin
                 if (cin == 1'b0)
                        s = s0;
                     else
                        s = s1;
            end


    endmodule




    module full_adder_csa(
                      input x,
                      input y,
                      input cin,
                      output logic s,
                      output logic cout
                     );
   assign s = x ^ y ^ cin;
   assign cout = (x&y) | (y&cin) | (cin&x);

   endmodule

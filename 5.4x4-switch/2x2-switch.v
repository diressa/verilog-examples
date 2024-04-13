module s2x2(
    input in0, in1, sel,
    output reg out0, out1
);

  always @* begin
    // sel = 0, parallel
    if (sel == 0) begin
      out0 = in0;
      out1 = in1;
    end

    // sel = 1, cross
    else begin
      out0 = in1;
      out1 = in0;
    end
  end

endmodule

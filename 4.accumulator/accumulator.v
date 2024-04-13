module accumulator(
  input clk, reset,
  input [31:0] A,
  input [3:0] n,           // Keeps track of n inputs
  output reg [31:0] Y
);

reg [31:0] sum;            // Accumulated sum


always @(posedge clk) begin
  if (reset == 1) begin
    sum <= 32'b0;          // Initialize sum as 0 when circuit is reset
  end

  else begin
    if (n < 4'b1001) begin // 0-9 n inputs added, 10 in total
      sum <= sum + A;
    end
    else begin
      Y <= sum + A;       // Final sum assigned to output Y
    end
  end

end

endmodule

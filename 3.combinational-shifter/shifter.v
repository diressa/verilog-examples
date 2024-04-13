module comb_shifter(
    input [7:0] A,
    input [3:0] n,      // shift 7 possible bits, (8/0 for none/full cycle)
    input dir,          // 0 shift right, 1 shift left
    output reg [7:0] Y  // shifted value
);

  always @* begin
    case (n)
      4'b0000: Y = A;                             // no shift
      4'b0001: Y = (dir == 0) ? A >> n : A << n;  // shift right n bits if dir = 0, left n bits otherwise. then set it to output Y.
      4'b0010: Y = (dir == 0) ? A >> n : A << n;  // shift 2
      4'b0011: Y = (dir == 0) ? A >> n : A << n;  // shift 3
      4'b0100: Y = (dir == 0) ? A >> n : A << n;  // shift 4...
      4'b0101: Y = (dir == 0) ? A >> n : A << n;
      4'b0110: Y = (dir == 0) ? A >> n : A << n;
      4'b0111: Y = (dir == 0) ? A >> n : A << n;  // only need to set n for 1-7 shifts (7 possible changes)
      default: Y = 8'b0000_0000;                  // error or full cycle (8+ shifts).
    endcase
  end

endmodule

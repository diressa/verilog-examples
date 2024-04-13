module sum;
  reg [31:0] A_top;                      // "top" as in top module.
  reg [3:0] n;
  reg clk_top, reset_top;
  wire [31:0] Y_top;

  accumulator dut(.clk(clk_top), .reset(reset_top), .A(A_top), .n(n), .Y(Y_top));

  always #5 clk_top = ~clk_top;          // Toggle clock- 10 seconds for 1 cycle


  initial begin
    $dumpfile("accumulator.vcd"); $dumpvars;
    $display("Sum Accumulator: ");

    //Initialize
    clk_top = 0;
    reset_top = 1;      // Apply reset- First procedure iteration (reset==1) initializes sum to 0 in the accumulator module at 5s.
    A_top = 32'b0;
    #10 reset_top = 0;  // Wait 1 cycle, 10s. clk_top = 1 at 5-10s. The procedure begins at posedge/positive edge here.

    for (n = 0; n < 10; n = n + 1) begin
      A_top = 32'b0000_0000_0000_0000_0000_0000_0000_0001; // One is added 10 times
      $display("A is %h", A_top);
      #10;                               // One cycle
    end

    $display("Total sum: %h", Y_top);    // Displays sum after 11th cycle
    reset_top = 1;                       // sum = 0 in accumulator module when reset = 1
    #10 reset_top = 0;                   // Another 10 seconds for full cycle
    $display("Total sum AFTER reset: %h", Y_top);

    for (n = 0; n < 10; n = n + 1) begin // Two is added 10 times
      A_top = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
      $display("A is %h", A_top);
      #10;
    end

    for (n = 0; n < 10; n = n + 1) begin
      A_top = $random;                  // Random numbers are added 10 times
      $display("A is %h", A_top);
      #10;
    end

    $display("Total sum: %h", Y_top);
    reset_top = 1;
    #10 reset_top = 0;
    $display("Total sum AFTER reset: %h", Y_top);

    $finish;
  end


endmodule

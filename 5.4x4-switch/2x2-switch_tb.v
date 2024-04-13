module switch2x2;
  reg in0, in1, sel;
  wire out0, out1;

  // Instantiate
  s2x2 uut(in0, in1, sel, out0, out1);


  initial begin
    $dumpfile("2x2-switch.vcd"); $dumpvars(0, switch2x2);

    // Initialize
    in0 = 0;
    in1 = 1;

    $display("2x2 Switch Cases: ");

    // 2^1 (=2) possibilities with the same input:
    // Test 1: Selector 'sel' is 0, parallel 2x2 switch
    sel = 0;
    #10
    $display("Test 1, parallel: in0 = %b, in1 = %b", in0, in1);
    $display("Output out0 = %b, Output out1 = %b", out0, out1);

    // Test 2: Selector 'sel' is 1, crossed 2x2 switch
    sel = 1;
    #10
    $display("Test 2, cross: in0 = %b, in1 = %b", in0, in1);
    $display("Output out0 = %b, Output out1 = %b", out0, out1);

    $finish();
  end


endmodule

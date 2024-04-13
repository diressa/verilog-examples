module test_s4x4;

  reg in0, in1, in2, in3;
  reg [1:0] sela, selb;
  wire out0, out1, out2, out3;

  // Instantiate
  s4x4 uut(in0, in1, in2, in3, sela, selb, out0, out1, out2, out3);

  initial begin
    $dumpfile("4x4-switch.vcd"); $dumpvars;

    // Initialize inputs, 0110
    in0 = 0; in1 = 1;
    in2 = 1; in3 = 0;

    #5 $display("4x4 Switch: ");
    $display("Orginal Inputs: %b, %b, %b, %b", in0, in1, in2, in3);


    // Testing all 16 unique possibilities for the same input:
    // Test 1:
    sela = 2'b00;                                                // Switch 1 and 2 are parallel
    selb = 2'b00;                                                // Connector wires are parallel
    #5 $display("Test 1: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 0, 1, 1, 0


    // Test 2: 
    sela = 2'b01;                                                // Switch 1 is crossed, switch 2 is parallel
    selb = 2'b00;                                                // Connector wires are parallel
    #5 $display("Test 2: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 1, 0, 1, 0


    // Test 3:
    sela = 2'b10;                                                // Switch 1 is parallel, switch 2 is crossed
    selb = 2'b00;                                                // Connector wires are parallel
    #5 $display("Test 3: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 0, 1, 0, 1


    // Test 4:
    sela = 2'b11;                                                // Switch 1 and 2 are crossed
    selb = 2'b00;                                                // Connector wires are parallel
    #5 $display("Test 4: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 1, 0, 0, 1


    // Test 5:
    sela = 2'b00;                                                // Switch 1 and 2 are parallel
    selb = 2'b01;                                                // Inner wires cross, outsides are parallel
    #5 $display("Test 5: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 0, 1, 1, 0


    // Test 6:
    sela = 2'b01;                                                // Switch 1 is crossed, switch 2 is parallel
    selb = 2'b01;                                                // Inner wires cross, outsides are parallel
    #5 $display("Test 6: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 1, 1, 0, 0


    // Test 7:
    sela = 2'b10;                                                // Switch 1 is parallel, switch 2 is crossed
    selb = 2'b01;                                                // Inner wires cross, outsides are parallel
    #5 $display("Test 7: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 0, 0, 1, 1


    // Test 8:
    sela = 2'b11;                                                // Switch 1 and 2 are crossed
    selb = 2'b01;                                                // Inner wires cross, outsides are parallel
    #5 $display("Test 8: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 1, 0, 0, 1


    // Test 9:
    sela = 2'b00;                                                // Switch 1 and 2 are parallel
    selb = 2'b10;                                                // Inner wires are parallel, outsides cross
    #5 $display("Test 9: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 0, 1, 1, 0


    // Test 10:
    sela = 2'b01;                                                // Switch 1 is crossed, switch 2 is parallel
    selb = 2'b10;                                                // Inner wires are parallel, outsides cross
    #5 $display("Test 10: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 0, 0, 1, 1


    // Test 11:
    sela = 2'b10;                                                // Switch 1 is parallel, switch 2 is parallel
    selb = 2'b10;                                                // Inner wires are parallel, outsides cross
    #5 $display("Test 11: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 1, 1, 0, 0


    // Test 12:
    sela = 2'b11;                                                // Switch 1 and 2 are crossed
    selb = 2'b10;                                                // Inner wires are parallel, outsides cross
    #5 $display("Test 12: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 1, 0, 0, 1


    // Test 13:
    sela = 2'b00;                                                // Switch 1 and 2 are parallel
    selb = 2'b11;                                                // Both connector wires are crossed
    #5 $display("Test 13: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 1, 0, 0, 1


    // Test 14:
    sela = 2'b01;                                                // Switch 1 is crossed, switch 2 is parallel
    selb = 2'b11;                                                // Both connector wires are crossed
    #5 $display("Test 14: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 1, 0, 1, 0


    // Test 15:
    sela = 2'b10;                                                // Switch 1 is parallel, switch 2 is crossed
    selb = 2'b11;                                                // Both connector wires are crossed
    #5 $display("Test 15: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 0, 1, 0, 1


    // Test 16:
    sela = 2'b11;                                                // Switch 1 and 2 are crossed
    selb = 2'b11;                                                // Both connector wires are crossed
    #5 $display("Test 16: ");
    $display("Selections: a- %b, b- %b", sela, selb);
    $display("Outputs: %b, %b, %b, %b", out0, out1, out2, out3); // Expected outcome: 0, 1, 1, 0

    $finish;
  end

endmodule

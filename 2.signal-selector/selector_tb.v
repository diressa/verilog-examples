module selector;
  reg [3:0] a0,a1,a2;
  reg [1:0] sel;
  wire [3:0] y;

initial //initializing signal variables
  begin
    a0 = 4'b0001;
    a1 = 4'b0010;
    a2 = 4'b0011;
  end

// uut: Unit Under Test
three_choices uut (a0, a1, a2, sel, y);

initial
  begin
    $dumpfile("hw1q2.vcd"); $dumpvars(0, selector);

    sel = 2'b00;
    #10
    $display("Case 1: sel = %b, y = %b", sel, y); //signal a0

    sel = 2'b01;
    #10
    $display("Case 2: sel = %b, y = %b", sel, y); //signal a1

    sel = 2'b10;
    #10
    $display("Case 3: sel = %b, y = %b", sel, y); //signal a2

    sel = 2'b11;
    #10
    $display("Case 4: sel = %b, y = %b", sel, y); //error/default case

    $finish();
  end

endmodule

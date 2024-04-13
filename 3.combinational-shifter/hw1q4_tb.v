module shift_test;

  reg [7:0] A;
  reg [3:0] n;
  reg dir;
  wire [7:0] Y;


  //Instantiate module from hw1q4.v
  comb_shifter uut(A, n, dir, Y);

  //Initialize variables
  initial begin
    A = 8'b1000_0001;
  end


  initial begin
    $dumpfile("hw1q4.vcd"); $dumpvars(0, shift_test);
    $display("Combinational Shifter: ");

    for (n = 4'b0000; n < 4'b1000; n = n + 4'b0001) begin   // n=0;n<8;n=n+1 also works
        //Shift right
        //n = n;
        dir = 0;
        #10
        $display("Case %b right: A = %b, n = %b, dir = %b, Y = %b", n, A, n, dir, Y);

        //Shift left
        //n = n;
        dir = 1;
        #10
        $display ("Case %b left: A = %b, n = %b, dir = %b, Y = %b", n, A, n, dir, Y);
    end


    //Case 8 defaults: Shift 8
    n = 4'b1000;
    dir = 1;
    #10
    $display("Case 8 aka default: A = %b, n = %b, dir = %b, Y = %b", A, n, dir, Y);

    //Default: Error, 8+ shift, or complete cycle
    n = 4'b1111;
    dir = 0;
    #10
    $display("Default Case: A = %b, n = %b, dir = %b, Y = %b", A, n, dir, Y);
    $finish();
  end


endmodule

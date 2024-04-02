module hot_encoder;
    reg [3:0] A;
    wire [1:0] B;

// Instantiate the module under hw1q1
    OneHotToBinary dut (
        .A(A),
        .B(B)
    );

// Clock generation
    reg clk = 0;
    always #5 clk = ~clk;


initial begin
    $dumpfile("hw1q1.vcd");
    $dumpvars(0,hot_encoder);

        // Test case 1: A[0] active
        A = 4'b0001;
        #10 $display("Test case 1: A = %b, B = %b", A, B);

        // Test case 2: A[1] active
        A = 4'b0010;
        #10 $display("Test case 2: A = %b, B = %b", A, B);

        // Test case 3: A[2] active
        A = 4'b0100;
        #10 $display("Test case 3: A = %b, B = %b", A, B);

        // Test case 4: A[3] active
        A = 4'b1000;
        #10 $display("Test case 4: A = %b, B = %b", A, B);

        // Test case 5: Multiple bits active (Default case)
        A = 4'b1111;
        #10 $display("Test case 5: A = %b, B = %b", A, B);

    $finish();
end


endmodule

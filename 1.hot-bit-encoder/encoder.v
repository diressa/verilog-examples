module OneHotToBinary (
    input [3:0] A,
    output reg [1:0] B
);

always @* begin
    case (A)
        4'b0001: B = 2'b00; // A[0] active
        4'b0010: B = 2'b01; // A[1] active
        4'b0100: B = 2'b10; // A[2] active
        4'b1000: B = 2'b11; // A[3] active
        default: B = 2'b00; // none or multiple bits active
    endcase
end

endmodule

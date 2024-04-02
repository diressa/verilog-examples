module three_choices(
    input [3:0] a0, a1, a2,
    input [1:0] sel,
    output [3:0] y
);

assign y = (sel == 2'b00) ? a0 :
            (sel == 2'b01)? a1 :
            (sel == 2'b10)? a2 :
            (sel == 2'b11)? 4'b0000 : //If sel is three, the output should be 0.
            4'b1111;                  //Error case... I would set it to 0, but didn't want to confuse it with sel=3 for this example

endmodule

// Question: Write an assign instruction to set an output between three possible signals a0[3:0],a1[3:0], a2[3:0], based on another signal value sel.
//
// Output choices for a0,a1,a2 are = 'X' when chosen, because no meaningful value was defined.
// If a number such as 0, 1 , or 2 is defined, then the output would change accordingly.

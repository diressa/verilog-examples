`include "2x2-switch.v"

module s4x4(
  input in0, in1, in2, in3,
  input [1:0] sela, selb,             // Made these variables for wire crossing into two 2-bit for readability (instead of one 4-bit)
  output reg out0, out1, out2, out3
);

wire temp0, temp1, temp2, temp3;      // Temporary variables to set the final four outputs
wire filler;                          // Filler for inputs and outputs 0, 1, 2, 3 in switch 3 and 4
wire nosel;                           // 'nosel' is set to make .sel 0 in in switch 3 and 4

assign nosel = 0;                     // sel is always 0 with 'nosel'

s2x2 switch1(.in0(in0), .in1(in1), .sel(sela[0]), .out0(temp0), .out1(temp1));
s2x2 switch2(.in0(in2), .in1(in3), .sel(sela[1]), .out0(temp2), .out1(temp3));

s2x2 switch3(.in0(filler), .in1(filler), .sel(nosel), .out0(filler), .out1(filler));   // Filler used for .out0(out0), .out1(out1), directly connected to its input ports
s2x2 switch4(.in0(filler), .in1(filler), .sel(nosel), .out0(filler), .out1(filler));   // Filler used for .out0(out2), .out1(out3), directly connected to its input ports

always @* begin
  case (selb)
  2'b00: begin                        // Parallel wires
  out0 = temp0; out1 = temp1;
  out2 = temp2; out3 = temp3;
  end

  2'b01: begin                        // Inner wires cross
    out0 = temp0; out1 = temp2;       // Switch 3
    out2 = temp1; out3 = temp3;       // Switch 4
  end

  2'b10: begin                        // Outer wires cross
  out0 = temp3; out1 = temp1;
  out2 = temp2; out3 = temp0;
  end

  2'b11: begin                        // All wires cross (switch 1 outputs to switch 4; switch 2 outputs to switch 3)
  out0 = temp2; out1 = temp3;
  out2 = temp0; out3 = temp1;
  end

  default: begin                      // Error case
    out0 = 0; out1 = 0;
    out2 = 0; out3 = 0;
  end
  endcase
end

endmodule

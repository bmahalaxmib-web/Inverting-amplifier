`timescale 1ns/1ps

module inverting_amplifier #(
    parameter real R_IN = 10.0,
    parameter real R_F  = 20.0
)(
    input  real vin,
    output real vout
);

    assign vout = -(R_F / R_IN) * vin;

endmodule
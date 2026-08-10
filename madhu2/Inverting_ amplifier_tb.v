`timescale 1ns/1ps

module tb_inverting_amplifier;

    real vin;
    wire real vout;

    inverting_amplifier #(
        .R_IN(10.0),
        .R_F(20.0)
    ) dut (
        .vin(vin),
        .vout(vout)
    );

    initial begin
        $display("Time\tVin(V)\tVout(V)");
        $display("-----------------------");

        vin = 0;
        #10;
        $display("%0t\t%0.2f\t%0.2f", $time, vin, vout);

        vin = 1;
        #10;
        $display("%0t\t%0.2f\t%0.2f", $time, vin, vout);

        vin = 2;
        #10;
        $display("%0t\t%0.2f\t%0.2f", $time, vin, vout);

        vin = -1;
        #10;
        $display("%0t\t%0.2f\t%0.2f", $time, vin, vout);

        $finish;
    end

endmodule
# Inverting Amplifier in Verilog

A simple behavioral Verilog implementation and testbench for an **inverting amplifier**.

## Overview

An inverting amplifier produces an output voltage that is proportional to the input voltage with an inverted polarity.

The ideal amplifier equation is:

[
V_{out} = -\frac{R_f}{R_{in}}V_{in}
]

In this project:

* Input resistance (`R_IN`) = **10 kΩ**
* Feedback resistance (`R_F`) = **20 kΩ**
* Voltage gain = **-2**

Therefore:

[
V_{out} = -2V_{in}
]

## Project Structure

```text
inverting-amplifier-verilog/
├── inverting_amplifier.v
├── tb_inverting_amplifier.v
└── README.md
```

## Verilog Module

The `inverting_amplifier` module uses Verilog `real` values to model analog voltage behavior.

```verilog
module inverting_amplifier #(
    parameter real R_IN = 10.0,
    parameter real R_F  = 20.0
)(
    input  real vin,
    output real vout
);

    assign vout = -(R_F / R_IN) * vin;

endmodule
```

## Testbench

The testbench applies different input voltages and displays the corresponding output.

### Test Cases

| Vin (V) | Expected Vout (V) |
| ------: | ----------------: |
|       0 |                 0 |
|       1 |                -2 |
|       2 |                -4 |
|      -1 |                 2 |

## Expected Output

```text
Time    Vin(V)  Vout(V)
-----------------------
10      0.00    -0.00
20      1.00    -2.00
30      2.00    -4.00
40     -1.00     2.00
```

## Simulation

Using **Icarus Verilog**:

```bash
iverilog -g2012 -o sim inverting_amplifier.v tb_inverting_amplifier.v
vvp sim
```

## Concept

For an ideal inverting amplifier:

```text
                 Rf
          +-----/\/\-----+
          |              |
Vin ------/\/\-----+     |
        Rin        |     |
                   |     |
                   +-----|−\
                         |  \____ Vout
                    GND--|+/
```

The voltage gain is determined by the ratio of the feedback resistance to the input resistance:

[
A_v = -\frac{R_f}{R_{in}}
]

For `R_F = 20 kΩ` and `R_IN = 10 kΩ`:

[
A_v = -\frac{20}{10} = -2
]

Thus, a `1 V` input produces a `-2 V` output.

## Files

### `inverting_amplifier.v`

Contains the behavioral model of the inverting amplifier.

### `tb_inverting_amplifier.v`

Contains the testbench used to verify the amplifier behaviour
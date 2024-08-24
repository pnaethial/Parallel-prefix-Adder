<span style="font-size:0.9em;">**Design and Characterization of Parallel Prefix Adders Using FPGA board**</span>
<hr>

Parallel prefix adders are high-performance circuits used for binary addition. 
They use a tree-like structure to propagate carries in parallel, which significantly speeds up the addition process compared to simpler ripple-carry adders.
These adders are particularly useful in high-speed computing applications where rapid addition operations are crucial.

***Ripple-Carry Adder:*** Each bit's carry is propagated to the next bit sequentially, which can be slow for large bit-widths.
***Parallel Prefix Adder:*** Uses a tree-like structure to compute carries in parallel, reducing the time complexity of carry propagation.

Prefix Operation:

    Generate (G): Indicates if a carry will be generated at a particular stage.
    Propagate (P): Indicates if a carry will be propagated through to the next stage.

module prefixadder (
    input logic [3:0] A, B,
    output logic [4:0] Sum
);
    logic [3:0] P[0:3], G[0:3], C[0:4];

    // Stage 1
    assign G[0] = A[0] & B[0];
    assign P[0] = A[0] ^ B[0];
    assign C[1] = G[0] | (P[0] & 1'b0);

    // Stage 2
    assign G[1] = A[1] & B[1];
    assign P[1] = A[1] ^ B[1];
    assign C[2] = G[1] | (P[1] & C[1]);

    // Stage 3
    assign G[2] = A[2] & B[2];
    assign P[2] = A[2] ^ B[2];
    assign C[3] = G[2] | (P[2] & C[2]);

    // Stage 4
    assign G[3] = A[3] & B[3];
    assign P[3] = A[3] ^ B[3];
    assign C[4] = G[3] | (P[3] & C[3]);

    // Final sum expression
    assign Sum = {C[4], C[3], C[2], C[1], C[0]};

endmodule

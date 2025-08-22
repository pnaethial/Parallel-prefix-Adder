module parallel_prefix_adder #(parameter N = 16)(
    input  logic [N-1:0] A, B,
    input  logic         Cin,
    output logic [N-1:0] Sum,
    output logic         Cout
);

    logic [N-1:0] P, G;
    logic [N-1:0] GP_G, GP_P;
    logic [N:0]   carry;

    // Step 1: bitwise propagate and generate
    always_comb begin
        for (int i = 0; i < N; i++) begin
            P[i] = A[i] ^ B[i];
            G[i] = A[i] & B[i];
        end
    end

    always_comb begin
        GP_G = G;
        GP_P = P;
        for (int shift = 1; shift < N; shift <<= 1) begin
            for (int i = N-1; i >= shift; i--) begin
                GP_G[i] = GP_G[i] | (GP_P[i] & GP_G[i-shift]);
                GP_P[i] = GP_P[i] & GP_P[i-shift];
            end
        end
    end

    always_comb begin
        carry[0] = Cin;
        for (int i = 0; i < N; i++) begin
            carry[i+1] = GP_G[i] | (GP_P[i] & Cin);
        end
    end
    
    always_comb begin
        for (int i = 0; i < N; i++) begin
            Sum[i] = P[i] ^ carry[i];
        end
        Cout = carry[N];
    end
endmodule

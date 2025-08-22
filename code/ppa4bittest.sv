module tb_parallel_prefix_adder;
    parameter N = 16;

    logic [N-1:0] A, B;
    logic Cin;
    logic [N-1:0] Sum;
    logic Cout;
    
    parallel_prefix_adder #(N) dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    task automatic test_case(input logic [N-1:0] a, b, input logic cin);
        logic [N:0] expected;
        begin
            A = a;
            B = b;
            Cin = cin;
            #1; 
            
            expected = a + b + cin;
            if (({Cout, Sum} !== expected))
                $display("FAIL: A=%0h B=%0h Cin=%0b | Sum=%0h Cout=%0b (Expected %0h)", 
                    a, b, cin, Sum, Cout, expected);
            else
                $display("PASS: A=%0h B=%0h Cin=%0b | Sum=%0h Cout=%0b", 
                    a, b, cin, Sum, Cout);
        end
    endtask

    initial begin
        $display("==== Parallel Prefix Adder Testbench ====");

        //  Zero
        test_case(16'h0000, 16'h0000, 0);

        // Simple addition, no carry in
        test_case(16'h0001, 16'h0002, 0);

        //  Simple addition, carry in
        test_case(16'h0001, 16'h0002, 1);

        //  All ones
        test_case(32'h34FFFF0F, 32'h28330001, 0);

        //  All ones with cin
        test_case(16'hFFFF, 16'h0000, 1);

        //  Random values
        test_case(16'h1234, 16'h5678, 0);
        test_case(16'hABCD, 16'hA7BD, 1);
        test_case(16'hF0F0, 16'h0F0F, 0);

        //  Overflow
        test_case(16'hFFFF, 16'hFFFF, 1);

        $display("==== Testbench Complete ====");
        $finish;
    end
endmodule

// module prefixaddertest;
//     parameter WIDTH = 4;
//     logic [WIDTH-1:0] A, B;
//     logic [WIDTH:0] Sum;
//     prefixadder #(WIDTH) uut (
//         .A(A),
//         .B(B),
//         .Sum(Sum)
//     );
//     initial
// begin
// A=4'b1001;
// B=4'b1010;
//     end
// endmodule


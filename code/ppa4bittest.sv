module prefixaddertest;
    parameter WIDTH = 4;
    logic [WIDTH-1:0] A, B;
    logic [WIDTH:0] Sum;
    prefixadder #(WIDTH) uut (
        .A(A),
        .B(B),
        .Sum(Sum)
    );
    initial
begin
A=4'b1001;
B=4'b1010;
    end
endmodule



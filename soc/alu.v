module ALU #(parameter BIT_WIDTH = 32)(
    input [BIT_WIDTH - 1:0] A,
    input [BIT_WIDTH - 1:0] B,
    input [3:0] ALUctrl,
    output reg [BIT_WIDTH - 1:0] ALU_RESULT
    );
    
    always @(A or B or ALUctrl) begin
        case (ALUctrl)
            4'b0000: assign ALU_RESULT = A + B;
            4'b0001: assign ALU_RESULT = A - B;
            4'b0010: assign ALU_RESULT =($signed(A) < $signed(B)) ? 32'b1 : 32'b0;
            4'b0011: assign ALU_RESULT =(A < B) ? 32'b1 : 32'b0;
            4'b0100: assign ALU_RESULT = A & B;
            4'b0101: assign ALU_RESULT = A | B;
            4'b0110: assign ALU_RESULT = A ^ B;
            4'b0111: assign ALU_RESULT = A << B;
            4'b1000: assign ALU_RESULT = A >> B;
            4'b1001: assign ALU_RESULT = A >>> B;
            default: ALU_RESULT = 32'b0;
        endcase
    end
endmodule
module ALU_Control(        
    input [6:0] funct7,
    input [2:0] funct3,
    input [1:0] ALUOp,
    output reg [3:0] ALUctrl
    );
    
    always @(*) begin
        case ({ALUOp, funct7, funct3})
            12'b10_0000000_000: ALUctrl <= 4'b0000; // ADD
            12'b10_0100000_000: ALUctrl <= 4'b0001; // SUB
            12'b10_0000000_010: ALUctrl <= 4'b0010; // SLT
            12'b10_0000000_011: ALUctrl <= 4'b0011; // SLTU
            12'b10_0000000_111: ALUctrl <= 4'b0100; // AND
            12'b10_0000000_110: ALUctrl <= 4'b0101; // OR
            12'b10_0000000_100: ALUctrl <= 4'b0110; // XOR
            12'b10_0000000_001: ALUctrl <= 4'b0111; // SLL
            12'b10_0000000_101: ALUctrl <= 4'b1000; // SRL
            12'b10_0100000_101: ALUctrl <= 4'b1001; // SRA
            12'b00_XXXXXXX_XXX: ALUctrl <= 4'b0000; // LB/LBU/LH/LHU/LW/SB/SH/SW
            12'b01_XXXXXXX_000: ALUctrl <= 4'b0000; // BEQ
            12'b01_XXXXXXX_001: ALUctrl <= 4'b0001; // BNE
            12'b01_XXXXXXX_100: ALUctrl <= 4'b0010; // BLT
            12'b01_XXXXXXX_110: ALUctrl <= 4'b0011; // BLTU
            12'b01_XXXXXXX_101: ALUctrl <= 4'b0100; // BGE
            12'b01_XXXXXXX_111: ALUctrl <= 4'b0101; // BGEU
            default: ALUctrl <= 4'b0000; 
        endcase
    end
endmodule
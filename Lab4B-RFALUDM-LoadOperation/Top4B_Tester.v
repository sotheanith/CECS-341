`timescale 1ns / 1ps

module Top4B_Tester;

	// Inputs
	reg [4:0] Rn;
	reg [4:0] Rt;
	reg [4:0] Rm;
	reg RegWrite;
	reg clock;
	reg [8:0] BaseAddress;
	reg ALUSrc;
	reg [10:0] Opcode;
	reg [1:0] ALUOp;
	reg MemWrite;
	reg MemRead;
	reg MemToReg;

	// Outputs
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	Top4B uut (
		.Rn(Rn), 
		.Rt(Rt),
		.Rm(Rm),
		.RegWrite(RegWrite), 
		.clock(clock), 
		.BaseAddress(BaseAddress), 
		.ALUSrc(ALUSrc), 
		.Opcode(Opcode), 
		.ALUOp(ALUOp), 
		.Zero(Zero), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.MemToReg(MemToReg)
	);

	initial begin
		// Initialize Inputs
		Rn = 0;
		Rm=0;
		Rt = 0;
		RegWrite = 0;
		clock = 0;
		BaseAddress = 0;
		ALUSrc = 0;
		Opcode = 0;
		ALUOp = 0;
		MemWrite = 0;
		MemRead = 0;
		MemToReg = 0;

		#10;
		//Setup signal for load
		MemToReg=1;
		ALUSrc=1;
		{ALUOp,Opcode}=13'b10_11111000010;
		//Load value into Register 5
		#5;
		Rt=5;
		BaseAddress=9'b101000;
		#2;
		MemRead=1;
		RegWrite=1;
		#3;
		clock=1;
		#10;
		clock=0;
		MemRead=0;
		RegWrite=0;
		//Load value into Register 10
		#5;
		Rt=10;
		BaseAddress=9'b1010000;
		#2;
		MemRead=1;
		RegWrite=1;
		#3;
		clock=1;
		#10;
		clock=0;
		MemRead=0;
		RegWrite=0;
		
		MemToReg=0;
		//AND
		#5;
		Rn=5;
		Rm=10;
		Rt=1;
		ALUSrc=0;
		{ALUOp,Opcode}=13'b10_10001010000;
		#2;
		RegWrite=1;
		#3;
		clock=1;
		#10;
		clock=0;
		RegWrite=0;
		
		//OR
		#5;
		Rn=5;
		Rm=10;
		Rt=2;
		ALUSrc=0;
		{ALUOp,Opcode}=13'b10_10101010000;
		#2;
		RegWrite=1;
		#3;
		clock=1;
		#10;
		clock=0;
		RegWrite=0;
		
		//ADD
		#5;
		Rn=5;
		Rm=10;
		Rt=3;
		ALUSrc=0;
		{ALUOp,Opcode}=13'b10_10001011000;
		#2;
		RegWrite=1;
		#3;
		clock=1;
		#10;
		clock=0;
		RegWrite=0;
		
		//SUB
		#5;
		Rn=5;
		Rm=10;
		Rt=4;
		ALUSrc=0;
		{ALUOp,Opcode}=13'b10_11001011000;
		#2;
		RegWrite=1;
		#3;
		clock=1;
		#10;
		clock=0;
		RegWrite=0;
		
	$stop;
	end
      
endmodule


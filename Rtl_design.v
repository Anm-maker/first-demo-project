`timescale 1ns/1ps

module traffic_light_controller(
    input clk,
    input reset,
    output reg [2:0] highway,
    output reg [2:0] farm
);

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

reg [1:0] state;
reg [3:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0;
        counter <= 0;
    end else begin
        counter <= counter + 1;

        case(state)
            S0: if(counter == 5) begin state <= S1; counter <= 0; end
            S1: if(counter == 2) begin state <= S2; counter <= 0; end
            S2: if(counter == 5) begin state <= S3; counter <= 0; end
            S3: if(counter == 2) begin state <= S0; counter <= 0; end
        endcase
    end
end

always @(*) begin
    case(state)
        S0: begin highway = 3'b001; farm = 3'b100; end
        S1: begin highway = 3'b010; farm = 3'b100; end
        S2: begin highway = 3'b100; farm = 3'b001; end
        S3: begin highway = 3'b100; farm = 3'b010; end
    endcase
end

endmodule
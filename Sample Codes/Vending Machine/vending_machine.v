module vending_machine(
  output reg vend,
  output reg [2:0] change,state,
  input [2:0] coin,
  input clk,rst);
  
  parameter [2:0]rs_5= 3'b001;
  parameter [2:0]rs_10= 3'b010;
  parameter [2:0]rs_15= 3'b011;
  parameter [2:0]rs_20= 3'b100;
  parameter [2:0]rs_25= 3'b101;
  
  parameter [2:0]idle= 3'b000;
  parameter [2:0]five= 3'b001;
  parameter [2:0]ten= 3'b010;
  parameter [2:0]fifteen= 3'b011;
  parameter [2:0]twenty= 3'b100;
  parameter [2:0]twenty_five=3'b101;
  
  reg[2:0] next_state;
  
  always@(coin or state)
    begin
      next_state=0;
      case(state)
        idle:
          case(coin)
            rs_5: next_state=five;
            rs_10: next_state=ten;
            rs_25: next_state=twenty_five;
            default: next_state=idle;
          endcase
        five:
          case(coin)
            rs_5: next_state= ten;
            rs_10: next_state=fifteen;
            rs_25: next_state=twenty_five;
            default: next_state=five;
          endcase
        ten:
          case(coin)
            rs_5: next_state=fifteen;
            rs_10: next_state=twenty;
            rs_25: next_state=twenty_five;
            default: next_state=ten;
          endcase
        fifteen:
          case(coin)
            rs_5: next_state=twenty;
            rs_10: next_state=twenty_five;
            rs_25: next_state=twenty_five;
            default: next_state=fifteen;
          endcase
        twenty:
          case(coin)
            rs_5: next_state=twenty_five;
            rs_10: next_state=twenty_five;
            rs_25: next_state=twenty_five;
            default: next_state=twenty;
          endcase
        twenty_five:
          next_state=idle;
        default: next_state=idle;
      endcase
    end
  
  always@(clk)
    begin
      if(rst)
        begin
          change<=3'b000;
          vend<=1'b0;
          state<=idle;
        end
      else
        state<=next_state;
      case(state)
        idle:
          begin
            vend<=1'b0;
            change<=3'd0;
          end
        five:
          begin
            vend<=1'b0;
            if(coin==rs_25)
              change<=rs_5;
            else
              change<=3'd0;
          end
        ten:
          begin
            vend<=1'b0;
            if(coin==rs_25)
              change<=rs_10;
            else
              change<=3'd0;
          end
        fifteen:
          begin
            vend<=1'b0;
            if(coin==rs_25)
              change<=rs_15;
            else
              change<=3'd0;
          end
        twenty:
          begin
            vend<=1'b0;
            if(coin==rs_10)
              change<=rs_5;
            else
              if(coin==rs_25)
                change<=rs_20;
              else
                change<=3'd0;
          end
        twenty_five:
          begin
            vend<=1'b1;
            change<=3'd0;
          end
        default: state<=idle;
      endcase
    end
endmodule

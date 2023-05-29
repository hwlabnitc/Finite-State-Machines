module chess_clk_cntrl(
  output time_a,time_b,clr,
  input player_a,player_b,clk,reset);
  
  localparam run_a=0,run_b=1,stop=2,Wait=3;
  reg [1:0] state;
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        state<=stop;
      else
        case(state)
          run_a:
            casex({player_a,player_b})
              2'b0x: state<=run_a;
              2'b10: state<=run_b;
              2'b11: state<=Wait;
            endcase
          run_b:
            casex({player_a,player_b})
              2'bx0: state<=run_b;
              2'b01: state<=run_a;
              2'b11: state<=Wait;
            endcase
          stop:
            case({player_a,player_b})
              2'b00: state<=stop;
              2'b01: state<=run_a;
              2'b10: state<=run_b;
              2'b11: state<=Wait;
            endcase
          Wait:
            if(player_a==player_b) 
              state<=Wait;
          	else 
              if(player_a==1'b1)
                state<=run_b;
          	  else
                state<=run_a;
        endcase
    end
  assign time_a=state==run_a;
  assign time_b=state==run_b;
  assign clr=state==stop;
endmodule

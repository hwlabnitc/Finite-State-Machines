# Chess clock
### Design a chess clock that controls the timing for two players in a chess game, with the following specifications: 
### The module should have inputs player_a, player_b, clk, and reset, and outputs time_a, time_b, and clr. 
### The states are defined as below:
- `run_a ` (Player A's timer running)
- `run_b` (Player B's timer running)
- `stop` (both timers stopped)
- `Wait` (waiting state when both players press their buttons simultaneously).
 The state transitions should occur as follows: 
- On reset, the state transitions to `stop`
- In `run_a`, it stays in run_a if `player_a` is 0, transitions to `run_b` if `player_a` is 1 and `player_b` is 0, and transitions to `Wait` if both `player_a` and `player_b` are 1
- In `run_b`, it stays in `run_b` if `player_b` is 0, transitions to `run_a` if `player_b` is 1 and `player_a` is 0, and transitions to `Wait` if both `player_a` and `player_b` are 1
- In `stop`, it stays in `stop` if both `player_a` and `player_b` are 0, transitions to `run_a` if `player_b` is 1 and `player_a` is 0, transitions to `run_b` if `player_a` is 1 and `player_b` is 0, and transitions to `Wait` if both `player_a` and `player_b` are 1
- In `Wait`, it stays in `Wait` if `player_a` and `player_b` are equal, transitions to `run_b` if `player_a` is 1, and transitions to `run_a` if `player_b` is 1. 
The outputs should be assigned as follows: 
- `time_a` is high when in `run_a`
- `time_b` is high when in `run_b`
- `clr` is high when in `stop`.  
### Provide the Verilog code and testbench for this module.

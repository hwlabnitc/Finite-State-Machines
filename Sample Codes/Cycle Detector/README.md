# Cycle Detectors
### 1. Implement a Cycle Detector in Verilog to find the sequence ‘101001’ in a well-defined serial input bit stream using minimum number of states. Make sure to include the overlapping conditions also.

    Example:
    Input Stream:   0 1 1 0 1 0 0 1 0 1 0 1 0 0 1 0 1 0 0 1
    FSM Output:     0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1

### 2. Implement an FSM to detect non overlapping sequence '101011' in the serial input stream.
    
    Example:
    Input Stream:    0 1 1 0 1 0 1 0 1 1 0 1 1 0 1 0 1 1
    FSM Output:      0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1

### 3. Implement an FSM to detect non overlapping sequence '11101001' in the input stream.
    
    Example:
    Input Stream:    1 0 1 0 0 1 0 1 1 1 0 1 0 0 1 0 1 0 1 1 1 0 1 0 0 1
    FSM Output:      0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1
    

# Muller C - Element Detector

### Implement a modified Muller C - Element Detector which detects the sequence of type ‘1000….0001’. The FSM should give a high output whenever the number of low signals in between two high signal is a multiple of 3 greater than 0. The FSM you implement must be capable of detecting overlapping sequences and You are not allowed to use auxiliary memory for counter or use arithmetic operations for finding multiples of 3.
    Example:
    Input Stream:   1 0 1 1 0 0 0 0 0 0 1 1 1 0 0 0 1 0 0 0 1
    FSM Output:     0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 
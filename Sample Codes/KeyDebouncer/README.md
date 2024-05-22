# Key Debouncer

##  Design a Finite State Machine to scan a matrix keyboard with debounce functionality. The FSM must detect the stable key presses and other accidental jump keys should be avoided. A State Table is given for reference.

- Note: Prev_key stores the matrix id of the key that was previously pressed

| State | Condition | Output | Next State |
|---|---|---|---|
| Input | Key_pressed | 0 | Wait |
| Input | Key_pressed | 0 | Wait |
| Wait | Key_pressed && Key_Id == Prev_key | 0 | DebounceLow |
| Wait | (Key_Pressed && Key_Id == Prev_key) | 0 | Input |
| DebounceLow | Key_Pressed && Key_Id == Prev_key | 0 | DebounceHigh |
| DebounceLow | (Key_Pressed && Key_Id == Prev_key) | 0 | Input |
| DebounceHigh | Key_Pressed && Key_Id == Prev_key | 1 | Input |
| DebounceHigh | (Key_Pressed && Key_Id == Prev_key) | 0 | Input |


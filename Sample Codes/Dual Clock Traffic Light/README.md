# Dual Clock Traffic Light Controller

### There are three traffic lights (Red, Yellow, Green) on a highway. For convenience the company decided to reduce the active time for yellow light. Since the lights are old it doesn’t have reprogrammable hardware to reduce the number of clock cycles. Replacing the entire lights will increase the cost. So, your team comes up with an idea of a Moore machine based asynchronous controller which deals with two clocks, one fast and the other slow. This allows you to reduce the time without changing the number of clock cycles. You are given the task to implement the FSM logic for controller.
### Here is a breakdown of what you need to do:
- Time period for `slow` clock = 6 ns
- Time period for `fast` clock = 2 ns
1. Red light stays on for 3 `slow` clock cycles while other lights are off.
2. Then after the third `slow` clock cycle, yellow light stays on for 3 `fast` clock cycles while other lights are inactive.
3. Then after the third `fast` clock cycle, green light stays on for the next
three `slow` clock cycles while all other lights are off
4. Repeat this process until the end.

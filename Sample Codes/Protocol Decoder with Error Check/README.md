# Communication Protocol Decoder

## Design and implement a Verilog module to decode a serial communication protocol with the following characteristics:

- Start/Stop Bits: The protocol uses a single low to high signal to indicate the start of a packet and no specific stop bit to mark the end.

- Data Payload: The packet contains a fixed-size data payload (e.g., 8 bits).

- Checksum: A simple XOR checksum is appended to the data for error detection. The checksum is calculated over all data bytes in the packet.

### Structure of Data Packet

    Example: [0 1 1 0 1 1 0 0 1 1 0] (Packet with data and checksum).
        • The first two bits (0 1) represents the start bit.
        • The eight bits (10110011) represent the data payload.
        • The last bit (1) is the checksum, calculated as follows:
        • Initial checksum: 1 (as defined in the code)
            -- XOR with first data bit: 1 XOR 1 = 0
            -- XOR with second data bit: 0 XOR 0 = 0
            -- Continue XORing with all data bits
    The final XOR operation results in 0, which becomes the checksum appended to the data payload.



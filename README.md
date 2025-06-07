# RAM-16x16-FPGA

Synchronous static RAM with a 16x16 organization. The write command and the output enable command are active low, and the clock is active on the rising edge .

# INFO

We firstly load the memory ( 15 downto 0 ) with XX"0000" ( "empty" memory ) . 
We only write when the signal is negative and we do reach a rising edge on clock .
We read when the signal is positive regarding of the behaviour of the clock, if the clear is active low, we load with high impedance, otherwise with that specific memory .
View 'func.vdh' too see the implementation .

----------------------------------------------------------------------------------
-- Company: CR 1.3
-- Engineer: PIRVU STEFAN
-- 
-- Create Date:    21:58:28 05/07/2025 
-- Design Name: 
-- Module Name:    func - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: S? se modeleze func?ional în VHDL ?i s? se verifice prin
-- simulare o memorie RAM static sincron? cu organizarea 16x16.
-- Comanda de scriere ?i comanda de control a ie?irii sunt active în logic?
-- negativ? iar tactul este activ pe front pozitiv.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity func is
    Port ( iClockMem : in  STD_LOGIC;
           iWrite : in  STD_LOGIC;
           iaAdr : in  STD_LOGIC_VECTOR (3 downto 0);
           iaData : in  STD_LOGIC_VECTOR (15 downto 0);
           oaData : out  STD_LOGIC_VECTOR (15 downto 0);
           ioC : in  STD_LOGIC);
end func;

architecture Behavioral of func is

type Tip_Memorie is array (0 to 15) of STD_LOGIC_VECTOR(15 downto 0);
signal saMemRAM : Tip_Memorie := (
    X"0000", X"0000", X"0000", X"0000", -- 0x00, 0x02, 0x04, 0x06
    X"0000", X"0000", X"0000", X"0000", -- 0x08, 0x0A, 0x0C, 0x0E
    X"0000", X"0000", X"0000", X"0000", -- 0x10, 0x12, 0x14, 0x16
    X"0000", X"0000", X"0000", X"0000"  -- 0x18, 0x1A, 0x1C, 0x1E
); -- 16 avem

signal saQ : STD_LOGIC_VECTOR(15 downto 0);

begin

-- inscriere in memorie
saMemRAM( conv_integer(unsigned(iaADR)) ) <= iaData when (iWrite = '0') and (rising_edge(iClockMem));

-- citire din memorie

saQ <= saMemRAM (conv_integer(unsigned(iaADR)))when iWrite = '1';

oaData <= "ZZZZZZZZZZZZZZZZ" when ioC = '0' else saQ;



end Behavioral;


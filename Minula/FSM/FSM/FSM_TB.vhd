--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:03:32 01/09/2021
-- Design Name:   
-- Module Name:   D:/New folder/assignment 2/Minula/FSM/FSM/FSM_TB.vhd
-- Project Name:  FSM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FSM_TB IS
END FSM_TB;
 
ARCHITECTURE behavior OF FSM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         t : OUT  std_logic;
         u : OUT  std_logic;
         v : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';
   signal clk : std_logic := '0';


 	--Outputs
   signal t : std_logic;
   signal u : std_logic;
   signal v : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          a => a,
          b => b,
          c => c,
          t => t,
          u => u,
          v => v,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
	stim_proc_input_combination_1: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
			a<='0';	--load 0 into a
			b<='0';	--load 0 into b
			c<='0';	--load 0 into c

		wait for 20 ns;	
			a<='1';	--load 0 into a
			b<='0';	--load 0 into b
			c<='0';	--load 0 into c

		wait for 20 ns;	
			a<='0';	--load 0 into a
			b<='1';	--load 0 into b
			c<='0';	--load 0 into c

		wait for 20 ns;	
			a<='0';	--load 0 into a
			b<='0';	--load 0 into b
			c<='0';	--load 0 into c

      wait for 20 ns;	
			a<='1';	--load 0 into a
			b<='0';	--load 0 into b
			c<='1';	--load 0 into c
		wait for 10 ns;
			a<='0';	--load 0 into a
		
      wait for 10 ns;	
			b<='1';	--load 0 into b
			c<='1';	--load 0 into c

		wait for 20 ns;	
			a<='0';	--load 0 into a
			b<='0';	--load 0 into b
			c<='1';	--load 0 into c

      wait for 20 ns;	
			a<='0';	--load 0 into a
			b<='0';	--load 0 into b
			c<='0';	--load 0 into c

      wait;
   end process;
		
END;

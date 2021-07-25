LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_FSM IS
END tb_FSM;
 
ARCHITECTURE behavior OF tb_FSM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         clk : IN  std_logic;
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         t : OUT  std_logic;
         u : OUT  std_logic;
         v : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';

 	--Outputs
   signal t : std_logic;
   signal u : std_logic;
   signal v : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          clk => clk,
          a => a,
          b => b,
          c => c,
          t => t,
          u => u,
          v => v
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
   stim_proc: process
   begin		
     
	  a<='0';
	  b<='0';
	  c<='0';
		
	  wait for 20ns;
	
	  a<='1';
	  b<='0';
	  c<='0';
	  
	  wait for 20ns;
	
	  a<='0';
	  b<='1';
	  c<='0';
	  
	  wait for 20ns;
	
	  a<='0';
	  b<='0';
	  c<='1';
	  
	  wait for 20ns;
	
	  a<='0';
	  b<='0';
	  c<='0';
	  
	  wait for 20ns;
	
	  a<='0';
	  b<='0';
	  c<='1';
	  
	  wait for 20ns;
	
	  a<='0';
	  b<='1';
	  c<='0';
      wait;
   end process;

END;

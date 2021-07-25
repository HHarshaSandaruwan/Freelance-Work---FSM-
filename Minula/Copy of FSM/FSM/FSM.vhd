library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
    Port ( clk : in  STD_LOGIC;
           a,b,c : in  STD_LOGIC;
           t,u,v : out  STD_LOGIC);
end FSM;

architecture Behavioral of FSM is

type type_state is (start_st,task1,task2,termin);

signal states: type_state;

begin

process(clk) 
begin

if(rising_edge(clk))then
case states is
	when start_st => t <= '0';
						  u <= '0';
						  v <= '0';
							if(a='1')then
								states <= task1;
							elsif(b='1')then
								states <= task1;
							else
								states <= start_st;
							end if;
					
	when task1 => t <= '0';
					  u <= '1';
					  v <= '0';
						if(b='1')then
							states <= task2;
						else 
							states <= task1;
						end if;
						
	when task2 => t <= '1';
					  u <= '1';
					  v <= '0';
						if(c='0')then
							states <= termin;
						elsif(c='1')then
							states <= task1;
						end if;
						
	when termin => t <= '1';
					   u <= '1';
					   v <= '1';
						 if(c='1')then
						 	states <= start_st;
						 else 
						 	states <= termin;
						 end if;

	when others => states <= start_st;
	end case;
end if;

end process;

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:23:33 01/09/2021 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FSM is
    Port ( a : in  STD_LOGIC;  		--input
           b : in  STD_LOGIC;			--input
           c : in  STD_LOGIC;			--input
           t : out  STD_LOGIC; 		--Output
           u : out  STD_LOGIC;  		--Output
           v : out  STD_LOGIC;  		--output
           clk : in  STD_LOGIC);		--input
end FSM;

architecture Behavioral of FSM is
type state_type is (start_st,task1,task2,termin);
signal P_S,N_S :state_type;
begin

	sync_proc:process (a,b,c,clk,P_S,N_S)
		begin
				if (CLK 'event And CLK ='1') then  --state changing process defining
					P_S <= N_S;	--next state will be loaded in to current state at rising edge
				end if;
	end process sync_proc;			
				
	transition:process (a,b,c,clk,P_S,N_S)
		begin case P_S is
			
				when start_st =>	--when current state is start_st "000" below code will be run
					t<='0';	--load 0 into t
					u<='0';	--load 0 into u
					v<='0';	--load 0 into v
					if(a='1') then	--if the input a is 1
						N_S <= task1;	--update task1 "010" as next state
					elsif(b='1') then	--if the input b is 1
						N_S <= task2;	--update task2 "110" as next state
					else
						N_S <= start_st;	--for any other input changes update start_st "000" as next state
					end if;
						
				when task1 =>  --when current state is task1 "010" below code will be run
					t<='0';	--load 0 into t
					u<='1';	--load 1 into u
					v<='0';	--load 0 into v
					if(b='1') then	--if the input b is 1
						N_S <= task2;	--update task1 "110" as next state
					else
						N_S <= task1;	--for any other input changes update task1 "010" as next state
					end if;
				
				when task2 =>  --when current state is task2 "110" below code will be run
					t<='1';	--load 1 into t
					u<='1';	--load 1 into u
					v<='0';	--load 0 into v
					if(C='0') then	--if the input c is 0
						N_S <= termin;	--update termin "111" as next state
					elsif(C='1') then	--if the input c is 1
						N_S <= task1;	--update task1 "010" as next state
					else
						N_S <= task2;	--for any other input changes update task2 "110" as next state
					end if;
					
				when termin =>  --when current state is termin "111" below code will be run
					t<='1';	--load 1 into t
					u<='1';	--load 1 into u
					v<='1';	--load 1 into v
					if(C='1') then	--if the input c is 1
						N_S <= start_st;	--update start_st "000" as next state
					else
						N_S <= termin;	--for any other input changes update termin "010" as next state
					end if;
					
				when others => --if non of above conditions happened then load present state as next state
					N_S<=P_S;
					
			end case;
	end process transition;
	
end Behavioral;





















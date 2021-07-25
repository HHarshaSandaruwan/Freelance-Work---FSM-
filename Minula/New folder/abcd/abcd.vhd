----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:40 01/09/2021 
-- Design Name: 
-- Module Name:    abcd - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all ;

entity FSM is
			port (x,y,r, Reset, CLK :in std_logic;
					Z :out std_logic_vector (2 downto 0));
end FSM;

architecture behavior of FSM is
type state_type is (A,B,C);
signal PS :state_type;

begin
	P1: process (CLK, RESET)
		begin
			if RESET ='1' then
				PS <=A;
			elsif (CLK 'event And CLK ='1') then
				case PS is
					when A=>
					if (x ='0') then PS <=A;
					else PS <=B;
					end if ;
				when B=>
					if (x ='0') then PS <=A;
					else PS <=C;
					end if ;
				when C=>
					if (x ='0' ) then PS <=A;
					else PS <=C;
					end if ;
				end case ;
			end if;
	end Process P1;

	--P2: process (PS,x)
		--begin
			--case PS is
				--when A=>
					--if (x ='0') then z <='000';
					--else z <='1';
					--end if ;
				--when B=>
					--z <='0';
				--when C=>
					--if (x ='0') then z <='010';
					--else z <='0';
					--end if ;
			--end case ;
	--end Process P2;

end behavior;


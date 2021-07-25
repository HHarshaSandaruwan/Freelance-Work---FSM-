----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:12 01/09/2021 
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
LIBRARY ieee;

USE ieee.std_logic_1164.ALL;

ENTITY FSM IS			
	PORT(			
			reset	: IN	std_logic;	
			clock	: IN	std_logic;	
			buttons	: IN	std_logic_vector(1 DOWNTO 0);	
			lights	: OUT	std_logic_vector(1 DOWNTO 0)	
			);	
END FSM;		

ARCHITECTURE synthesis1 OF FSM IS	
TYPE	statetype IS (Idle, Opt1, Opt2, ter);
SIGNAL	currentstate, nextstate	: statetype;

BEGIN		
fsm1: PROCESS( buttons, currentstate )	
	BEGIN		
		CASE currentstate IS	
			WHEN Idle =>
				lights<="00";
	         CASE buttons IS	
					WHEN "00" =>
						nextstate <= Idle;
					WHEN "01" =>
						nextstate <= Opt1;
					WHEN "10" =>
						nextstate <= Opt2;
					WHEN OTHERS =>
						nextstate <= currentstate;
				END CASE;	
			WHEN Opt1 =>	
				lights <= "01";	
				IF buttons /= "01" THEN
					nextstate <= Idle;
				END IF;	
			WHEN Opt2 =>
				lights <= "10";
				IF buttons /= "10" THEN
					nextstate <= Idle;
				END IF;
			WHEN Error =>
				lights <= "11";
				IF buttons ="00" THEN
					nextstate <= Idle;
				END IF;

		END CASE;

	END PROCESS;

fsm2: PROCESS( reset, clock )

BEGIN

IF (reset = '0') THEN

currentstate <= Idle;

ELSIF (clock'EVENT) AND (clock = '1') THEN currentstate <= nextstate;

END IF;

END PROCESS;

END synthesis1;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity my_alu is
Port (
	A, B, op : in std_logic_vector(3 downto 0);
	calc_out : out std_logic_vector(3 downto 0)
	);
    
end my_alu;

architecture Behavioral of my_alu is
signal calc, greater : std_logic_vector(3 downto 0);



begin
	process(A,B)  
	begin
	if( unsigned(A) > unsigned(B)) then
    	greater <= "0001";
	else
    	greater <= "0000";
	end if;
	end process;
 

	process(A, B, op)
	begin
    
	case op is
	when "0000" =>
calc <= std_logic_vector(unsigned(A) + unsigned(B));
	when "0001" =>
    	calc <= std_logic_vector(unsigned(A) - unsigned(B));
	when "0010" =>
    	calc <= std_logic_vector(unsigned(A) + 1);
	when "0011" =>
    	calc <= std_logic_vector(unsigned(A) - 1);
	when "0100" =>
    	calc <= std_logic_vector(0 - unsigned(A));
	when "0101" =>
    	calc <= std_logic_vector(greater);
	-- shifting stuff
	when "0110" =>
    	calc <= std_logic_vector((unsigned(A) sll 1));
	when "0111" =>
    	calc <= std_logic_vector((unsigned(A) srl 1));
	when "1000" =>
    	calc <= std_logic_vector(shift_right(unsigned(A), 1));
	-------------------
	when "1001" =>
    	calc <= std_logic_vector(not(A));
	when "1010" =>
    	calc <= std_logic_vector(A and B);
	when "1011" =>
    	calc <= std_logic_vector(A or B);
	when "1100" =>
    	calc <= std_logic_vector(A xor B);
	when "1101" =>
    	calc <= std_logic_vector(A xnor B);
	when "1110" =>
    	calc <= std_logic_vector(A nand B);
	when "1111" =>
    	calc <= std_logic_vector(A nor B);
	when others =>
    	calc <= (others => '0');
	end case;
    
	calc_out <= calc;

end process;
end Behavioral;

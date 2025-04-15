library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_tester is
Port (
    	clk : in std_logic;
    	sw : in std_logic_vector(3 downto 0);
    	btn : in std_logic_vector(3 downto 0);
    	led : out std_logic_vector(3 downto 0)
);
end alu_tester;

architecture Structural of alu_tester is
    
	component debounce is
    	port(

        	clk : in std_logic;
        	btn : in std_logic;
        	dbnc : out std_logic

    	);

 	end component;
	 
 	component my_alu is
    	port(
        	A, B, op : in std_logic_vector(3 downto 0);
        	calc_out : out std_logic_vector(3 downto 0)
       	 
    	);
 	end component;
	 
 	signal dbnc_out, num1, num2, oper, alu_out : std_logic_vector(3 downto 0);
	 
begin
    


	db0 : debounce
    	port map(
         	clk => clk,
         	btn => btn(0),
         	dbnc => dbnc_out(0)
        	);
	 
 	db1 : debounce
    	port map(
         	clk => clk,
         	btn => btn(1),
         	dbnc => dbnc_out(1)
        	);
 	 
  	db2 : debounce
    	port map(
         	clk => clk,
         	btn => btn(2),
         	dbnc => dbnc_out(2)
        	);
  	db3 : debounce
    	port map(
         	clk => clk,
         	btn => btn(3),
         	dbnc => dbnc_out(3)
        	);
    
	ALU : my_alu
    	port map(
        	A => num1,
        	B => num2,
        	op => oper,
        	calc_out => alu_out
        	);
       	 
	process(clk)
	begin
    	if rising_edge(clk) then
        	if dbnc_out(0) = '1' then
            	num1 <= sw;
        	end if;
        	if dbnc_out(1) = '1' then
            	num2 <= sw;
        	end if;
        	if dbnc_out(2) = '1' then
            	oper <= sw;
        	end if;
        	if dbnc_out(3) = '1' then
            	num1 <= "0000";
            	num2 <= "0000";
            	oper <= "0000";
        	end if;
    	end if;
    	led <= alu_out;
   end process;
end Structural;

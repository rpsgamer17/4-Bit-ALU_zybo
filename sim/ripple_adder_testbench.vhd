library IEEE;
use IEEE.Std_logic_1164.all;

entity ripple_adder_testbench is
end ripple_adder_testbench;
 
architecture behavioral of ripple_adder_testbench is
    component ripple_adder 
        port( 
            A, B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            S : out std_logic_vector(3 downto 0);
            Cout : out std_logic
        );  
    end component; 

    signal A, B, S : std_logic_vector(3 downto 0);
    signal Cin : std_logic;
    signal Cout : std_logic;

begin   
    -- Instantiate the ripple_adder (Device Under Test)
    dut : ripple_adder 
    port map (
        A => A,
        B => B,
        Cin => Cin,
        S => S,
        Cout => Cout
    );

    -- Test process
    process
    begin
        A <= "0000"; B <= "0000"; Cin <= '0';
        wait for 100 ms;
        
        A <= "0000"; B <= "0000"; Cin <= '1';
        wait for 100 ms;  
        
        A <= "1111"; B <= "0000"; Cin <= '0';
        wait for 100 ms;
        
        A <= "0000"; B <= "1111"; Cin <= '1';
        wait for 100 ms;
        
        A <= "0000"; B <= "1111"; Cin <= '0';
        wait for 100 ms;
        
        A <= "1111"; B <= "0000"; Cin <= '1';
        wait for 100 ms;
        
        A <= "1111"; B <= "1111"; Cin <= '0';
        wait for 100 ms;   
        
        A <= "1111"; B <= "1111"; Cin <= '1';
        wait for 100 ms;
        
        A <= "1010"; B <= "0101"; Cin <= '1';
        wait for 100 ms;
        
        A <= "1001"; B <= "1001"; Cin <= '1';
        wait for 100 ms;

        

        

        wait;  -- Prevents process from restarting
    end process;
      
end behavioral;

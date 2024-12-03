library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_4bits is
    port(
        num1, num2 : in std_logic_vector(3 downto 0);
        num3 : out std_logic_vector(4 downto 0)
    );
end adder_4bits;

architecture adder_arch of adder_4bits is
    signal co0, co1, co2, co3 : std_logic;
    signal res : std_logic_vector(4 downto 0);
begin
    adder_a: entity work.adder_1bit(adder_arch)
    port map(
        a => num1(0),
        b => num2(0),
        ci => '0',
        co => co0,
        s => res(0)
    );
    
    adder_b: entity work.adder_1bit(adder_arch)
    port map(
        a => num1(1),
        b => num2(1),
        ci => co0,
        co => co1,
        s => res(1)
    );
    
    adder_c: entity work.adder_1bit(adder_arch)
    port map(
        a => num1(2),
        b => num2(2),
        ci => co1,
        co => co2,
        s => res(2)
    );
    
    adder_d: entity work.adder_1bit(adder_arch)
    port map(
        a => num1(3),
        b => num2(3),
        ci => co2,
        co => res(4),
        s => res(3)
    );
    num3 <= res;

end adder_arch;

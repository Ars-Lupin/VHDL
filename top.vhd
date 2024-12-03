library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    port(
        num1, num2 : in std_logic_vector(3 downto 0);
        mode : in std_logic;
        res : out std_logic_vector(4 downto 0)
    );
end top;

architecture top_arch of top is
    signal res_adder, res_subtractor : std_logic_vector(4 downto 0);
begin
    adder_unit : entity work.adder_4bits(adder_arch)
        port map(
            num1 => num1,
            num2 => num2,
            num3 => res_adder
        );
    subtractor_unit : entity work.adder_4bits(adder_arch)
        port map(
            num1 => num1,
            num2 => std_logic_vector(unsigned(not num2) + 1),
            num3 => res_subtractor
        );
    res <=  res_adder when mode = '0' else
            res_subtractor;

end top_arch;
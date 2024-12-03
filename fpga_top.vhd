library ieee;
use ieee.std_logic_1164.all;

entity fpga_top is
    port(
        sw : in std_logic_vector(15 downto 0);
        led : out std_logic_vector(15 downto 0)
    );
end fpga_top;

architecture fpga_arch of fpga_top is
begin
    top_unit : entity work.top(top_arch)
        port map(
            num1 => sw(7 downto 4),
            num2 => sw(3 downto 0),
            mode => sw(8),
            res => led(4 downto 0)
        );
end fpga_arch;
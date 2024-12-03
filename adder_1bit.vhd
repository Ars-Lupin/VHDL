library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_1bit is
    port(
        a : in std_logic;
        b : in std_logic;
        ci : in std_logic; -- Carry in
        co : out std_logic; -- Carry out
        ov : out std_logic;
        s : out std_logic
    );
end adder_1bit;

architecture adder_arch of adder_1bit is
begin
    co <= (a and b) or (ci and (a xor b));
    s <= (a xor b xor ci);
    ov <= (a and b and not ((a xor b xor ci))) or (not a and not b and (a xor b xor ci));


end adder_arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package dot_p is
	type dot_data_t is array (0 to 7) of unsigned(0 to 7);
	type dot_anim_t is array(integer range <>) of dot_data_t;

	constant dot_zeros : dot_data_t := (others => (others => '0'));
	constant dot_ones : dot_data_t := (others => (others => '1'));

	component dot

		port (
			-- dot
			dot_r, dot_g, dot_s : out unsigned(0 to 7);
			-- internal
			dot_clk                : in std_logic; -- 1kHz
			dot_ena                : in std_logic; -- '1' active, '0' blanks all leds
			dot_data_r, dot_data_g : in dot_data_t
		);

	end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dot_p.all;

entity dot is

	port (
		-- dot
		dot_r, dot_g, dot_s : out unsigned(0 to 7);
		-- internal
		dot_clk                : in std_logic; -- 1kHz
		dot_ena                : in std_logic; -- '1' active, '0' blanks all leds
		dot_data_r, dot_data_g : in dot_data_t
	);

end dot;

architecture arch of dot is

	signal scan_cnt : integer range 0 to 7;

begin

	process (dot_clk) begin 
		if rising_edge(dot_clk) and dot_ena = '1' then
			dot_s <= "01111111" ror scan_cnt; -- rotates '0' because common cathode
			dot_r <= dot_data_r(scan_cnt);
			dot_g <= dot_data_g(scan_cnt);
			scan_cnt <= scan_cnt + 1;
		end if; 
	end process;

end arch;
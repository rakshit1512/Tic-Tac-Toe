library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity endgame is
	Port (  track,who: in std_logic_vector (8 downto 0);
	rst:instd_logic;
	check,win1,win2: out std_logic:='0');
end endgame;

architecture Behavioral of endgame is

begin
process(track,who,rst)
BEGIN
if(RST='1')then
  check<='0';
	win1<='0';
	win2<='0';
end if;
	
if((track(0)='1' and track(1)='1' and track(2)='1'))then
	if((who(0)='0' and who(1)='0' and who(2)='0'))then
		check<='1';
		win1<='1';
	end if;
	if((who(0)='1' and who(1)='1' and who(2)='1'))then
		check<='1';
		win2<='1';
	end if;
end if;
if((track(0)='1' and track(4)='1' and track(8)='1'))then
	if((who(0)='0' and who(4)='0' and who(8)='0'))then
		check<='1';
		win1<='1';
	end if;
	if((who(0)='1' and who(4)='1' and who(8)='1'))then
		check<='1';
		win2<='1';
	end if;
end if;
if((track(2)='1' and track(5)='1' and track(8)='1'))then
	if((who(2)='0' and who(5)='0' and who(8)='0'))then
		check<='1';
		win1<='1';
	end if;
	if((who(2)='1' and who(5)='1' and who(8)='1'))then
		check<='1';
		win2<='1';
	end if;
end if;
if((track(1)='1' and track(4)='1' and track(7)='1'))then
	 if((who(1)='0' and who(4)='0' and who(7)='0'))then
		check<='1';
		win1<='1';
	end if;
	if((who(1)='1' and who(4)='1' and who(7)='1'))then
		check<='1';
		win2<='1';
	end if;
end if;
if((track(0)='1' and track(3)='1' and track(6)='1'))then
	if((who(0)='0' and who(3)='0' and who(6)='0'))then
		check<='1';
		win1<='1';
	end if;
	if((who(0)='1' and who(3)='1' and who(6)='1'))then
		check<='1';
		win2<='1';
	end if;
end if;
if((track(6)='1' and track(7)='1' and track(8)='1'))then
	if((who(6)='0' and who(7)='0' and who(8)='0'))then
		check<='1';
		win1<='1';
	end if;
	if((who(6)='1' and who(7)='1' and who(8)='1'))then
		check<='1';
		win2<='1';
	end if;
end if;
if((track(5)='1' and track(4)='1' and track(3)='1'))then
	if((who(5)='0' and who(4)='0' and who(3)='0'))then
		check<='1';
		win1<='1';
	end if;
	if((who(4)='1' and who(5)='1' and who(3)='1'))then
		check<='1';
		win2<='1';
	end if;
end if;
if((track(2)='1' and track(4)='1' and track(6)='1'))then
	if((who(4)='0' and who(2)='0' and who(6)='0'))then
		check<='1';
		win1<='1';
	end if;
	if((who(4)='1' and who(6)='1' and who(2)='1'))then
		check<='1';
		win2<='1';
	end if;
end if;
end process;
end Behavioral;

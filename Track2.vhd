library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity track2 is
	Port ( row,col: in std_logic_vector(2 downto 0);
			TEMP,rst: in std_logic;
			track1,who: out std_logic_vector(8 downto 0):="000000000");
end track2;

architectureBehavioral of track2 is

begin
process(rst,row,col,TEMP)
begin
  if(rst='1')then
    track1<="000000000";
	  who<="000000000";
	end if;
  if(row="100" and col="100")then
	  track1(0)<='1';
	  if(TEMP='0')then
		  who(0)<='0';
	  else
		  who(0)<='1';
	  end if;
  end if;

  if(row="100" and col="010")then
	  track1(1)<='1';
	  if(TEMP='0')then
		  who(1)<='0';
	  else
		  who(1)<='1';
	  end if;
  end if;

  if(row="100" and col="001")then
	  track1(2)<='1';
	  if(TEMP='0')then
		  who(2)<='0';
	  else
		  who(2)<='1';
	  end if;
  end if;

  if(row="010" and col="100")then
	  track1(3)<='1';
	  if(TEMP='0')then
		  who(3)<='0';
	  else
		  who(3)<='1';
	  end if;
  end if;

  if(row="010" and col="010")then
	  track1(4)<='1';
	  if(TEMP='0')then
		  who(4)<='0';
	  else
		  who(4)<='1';
	  end if;
  end if;

  if(row="010" and col="001")then
	  track1(5)<='1';
	  if(TEMP='0')then
		  who(5)<='0';
	  else
		  who(5)<='1';
	  end if;
  end if;

  if(row="001" and col="100")then
	  track1(6)<='1';
	  if(TEMP='0')then
		  who(6)<='0';
	  else
		  who(6)<='1';
	  end if;
  end if;

  if(row="001" and col="010")then
	  track1(7)<='1';
	  if(TEMP='0')then
		  who(7)<='0';
	  else
		  who(7)<='1';
	  end if;
  end if;

  if(row="001" and col="001")then
	  track1(8)<='1';
	  if(TEMP='0')then
		  who(8)<='0';
	  else
		  who(8)<='1';
	  end if;
end if;
end process;
endBehavioral;

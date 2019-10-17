library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity background is
    Port ( RST,clk: in  STD_LOGIC;
			TEMP: in std_logic:='0';
			RGB : out  STD_LOGIC_VECTOR (2 downto 0);
      row,col: in std_logic_vector(2 downto 0);
			H_SYNC : out  STD_LOGIC;
      V_SYNC : out  STD_LOGIC);
end background;

architecture Behavioral of background is
	
	signalintro:integer:=1;
	signal clk25: std_logic;
	constant HD : integer := 639;          --  639   Horizontal Display (640)
	constant HFP : integer := 16;          --   16   Right border (front porch)
	constant HSP : integer := 96;          --   96   Sync pulse (Retrace)
	constant HBP : integer := 48;        	--   48   Left boarder (back porch)
	
	constant VD : integer := 479;  			--  479   Vertical Display (480)
	constant VFP : integer := 10;       	--   10   Right border (front porch)
	constant VSP : integer := 2;				--    2   Sync pulse (Retrace)
	constant VBP : integer := 33;      		--   33   Left boarder (back porch)

	signal HP : integer := 0;
	signal VP : integer := 0;
	
	signal track: std_logic_vector(8 downto 0):="000000000";
	signal who: std_logic_vector(8 downto 0);
	signalend_count: integer:=1;
	signal check1,win1,win3,win4,check2,win2: std_logic:='0';
  
component track2 is
Port ( row,col: in std_logic_vector(2 downto 0);
		TEMP,rst: in std_logic;
    track1,who: out std_logic_vector(8 downto 0));
end component;

component endgame is
	Port (  track,who: in std_logic_vector(8 downto 0);
	rst: in std_logic;
  check,win1,win2: out std_logic:='0');
end component;

componentBackground_display is
	Port (  RST,clk25: in  STD_LOGIC;
			check,win1,win2,TEMP: in  STD_LOGIC;
			track,who:instd_logic_vector(8 downto 0);
			HP,VP: in integer;
			intro: inout integer :=0;
			RGB : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

begin

--Clock Freq
process(clk)
begin
	if(clk'event and clk='1')then
		clk25<=not clk25;
	end if;
end process;	

--Horizontal Position
process(clk25,RST)
begin	
	if(RST='1')then
		HP<=0;
	elsif(clk25'event and clk25='1')then
		if(HP=(HD+HFP+HSP+HBP))then
			HP<=0;
		else
			HP<=HP+1;
		end if;
	end if;
end process;

--Vertical Position
process(clk25,RST)
begin	
	if(RST='1')then
			VP<=0;
	elsif(clk25'event and clk25='1')then
		if(HP=(HD+HFP+HSP+HBP))then
			if(VP=(VD+VFP+VSP+VBP))then
				VP<=0;
			else
				VP<=VP+1;
			end if;
		END IF;
	end if;
end process;

--Horizontal Synchronisation
process(clk25,RST,HP)
begin
	if(RST='1')then
		H_SYNC<='0';
	elsif(clk25'event and clk25='1')then
		if( ( HP<=(HD+HFP) ) or ( HP>HD+HFP+HSP ) )then
			H_SYNC <='1';
		else
			H_SYNC <='0';
		end if;
	end if;
end process;

--Vertical Synchronisation
process(clk25,RST,VP)
begin
	if(RST='1')then
		V_SYNC<='0';
	elsif(clk25'event and clk25='1')then
		if( ( VP<=(VD+VFP) ) or ( VP>VD+VFP+VSP ) )then
			V_SYNC<='1';
		else
			V_SYNC<='0';
		end if;
	end if;
end process;

----Background:
b1: Background_display port map(RST,clk25,check2,win2,win4,TEMP,track,who,HP,VP,intro,RGB);

--TRACKING
l1:track2 port map(row,col,TEMP,RST,track,who);

--GAME LOGIC
--l2: gamelogic portmap(TEMP,track,HP,VP,RGB,who);

--END GAME
l3: endgame port map(track,who,RST,check1,win1,win3);

check2<=check1;
process(win1,win3)
begin
  if(win1='1')then
    win2<=win1;
  end if;
  if( win3='1')then
    win4<=win3;
  end if;
end process;
endBehavioral;

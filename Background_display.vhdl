library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entityBackground_display is
	Port (  RST,clk25: in  STD_LOGIC;
			check,win1,win2,TEMP: in  STD_LOGIC;
			track,who: in std_logic_vector(8 downto 0);
			HP,VP: in integer;
			intro: inout integer :=0;
			RGB : out  STD_LOGIC_VECTOR (2 downto 0):="000");
endBackground_display;

architecture Behavioral of Background_display is

signal a:std_logic_vector(8 downto 0):="000000000";

begin
process(clk25,RST,check,track,who,win1,win2,HP,VP,intro)
begin
	if(RST = '1')then
		RGB <= "000";
	elsif(clk25'event and clk25 = '1')then 
		if(check='0')then
			if(intro<300000000)then
				if((VP >200 and VP<210) and (HP>50   and   HP<90))then
					RGB <= "100"; -- WHITE
				elsif((VP >210 and VP< 250) and (HP>65   and   HP<75))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>100   and   HP<140))then
					RGB <= "010";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>150   and   HP<190))then
					RGB <= "001";   -- WHITE
				elsif((VP >210 and VP< 250) and (HP>150   and   HP<165))then
					RGB <= "001";   -- WHITE
				elsif((VP >240 and VP< 250) and (HP>150   and   HP<190))then
					RGB <= "001";   -- WHITE
				elsif((VP >220 and VP< 230) and (HP>200   and   HP<220))then
					RGB <= "111";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>230   and   HP<270))then
					RGB <= "100";   -- WHITE
				elsif((VP >210 and VP< 250) and (HP>245   and   HP<255))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>280   and   HP<320))then
					RGB <= "010";   -- WHITE
				elsif((VP >220 and VP< 230) and (HP>280   and   HP<320))then
					RGB <= "010";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>280   and   HP<290))then
					RGB <= "010";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>310   and   HP<320))then
					RGB <= "010";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>330   and   HP<370))then
					RGB <= "001";   -- WHITE
				elsif((VP >240 and VP< 250) and (HP>330   and   HP<370))then
					RGB <= "001";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>330   and   HP<340))then
					RGB <= "001";   -- WHITE
				elsif((VP >220 and VP< 230) and (HP>380   and   HP<400))then
					RGB <= "111";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>410   and   HP<450))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>425   and   HP<435))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>460   and   HP<500))then
					RGB <= "010";   -- WHITE
				elsif((VP >240 and VP< 250) and (HP>460   and   HP<500))then
					RGB <= "010";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>460   and   HP<470))then
					RGB <= "010";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>490   and   HP<500))then
					RGB <= "010";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>510   and   HP<550))then
					RGB <= "001";   -- WHITE
				elsif((VP >240 and VP< 250) and (HP>510   and   HP<550))then
					RGB <= "001";   -- WHITE
				elsif((VP >220 and VP< 230) and (HP>510   and   HP<550))then
					RGB <= "001";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>510   and   HP<520))then
					RGB <= "001";   -- WHITE
				elsif((VP >160 and VP< 290) and (HP>10   and   HP<30))then
					RGB <= "111";   -- WHITE
				elsif((VP >160 and VP< 290) and (HP>570   and   HP<590))then
					RGB <= "111";   -- WHITE
				elsif((VP >160 and VP< 180) and (HP>10   and   HP<590))then
					RGB <= "111";   -- WHITE
				elsif((VP >270 and VP< 290) and (HP>10   and   HP<590))then
					RGB <= "111";   -- WHITE
				else		
					RGB <= "000";   -- BLACK	
				intro<=intro+1;
				end if;
			else
				if(VP > 150 and VP< 170)then
					RGB <= "111"; -- WHITE
				elsif(VP > 300 and VP < 320)then
					RGB <= "111";   -- WHITE
				elsif(HP > 203 and HP < 223)then
					RGB <= "111";   -- WHITE
				elsif(HP > 416 and HP < 436)then
					RGB <= "111";   -- WHITE
				else		
					RGB <= "000";   -- BLACK
				end if;
			if(track(0)='1') then
				if (who(0)='0') then
						if((VP>50 AND VP<150) AND(HP>90 AND HP<110)) THEN
							RGB<="100";
						elsif((VP>65 AND VP<85) AND(HP>50 AND HP<150)) THEN
							RGB<="100";
						END IF;
						
					ELSE
						if((VP>50 AND VP<150) AND(HP>50 AND HP<150)) THEN
							RGB<="010";
						elsif((VP>70 AND VP<130) AND(HP>70 AND HP<130)) THEN
							RGB<="000";
						END IF;
					END IF;
				END if;
			if(track(1)='1') then
				if (who(1)='0') then
							if((VP>50 AND VP<150) AND(HP>310 AND HP<330)) THEN
								RGB<="100";
							elsif((VP>65 AND VP<85) AND(HP>270 AND HP<370)) THEN
								RGB<="100";
							END IF;
						ELSE
							if((VP>50 AND VP<150) AND(HP>270 AND HP<370)) THEN
								RGB<="010";
							elsif((VP>70 AND VP<130) AND(HP>290 AND HP<350)) THEN
								RGB<="000";
							END IF;
						END IF;
					end if;
					if(track(2)='1') then
				if (who(2)='0') then
							if((VP>50 AND VP<150) AND(HP>530 AND HP<550)) THEN
								RGB<="100";
							elsif((VP>65 AND VP<85) AND(HP>490 AND HP<590)) THEN
								RGB<="100";
							END IF;
						ELSE
							if((VP>50 AND VP<150) AND(HP>490 AND HP<590)) THEN
								RGB<="010";
							elsif((VP>70 AND VP<130) AND(HP>510 AND HP<570)) THEN
								RGB<="000";
							END IF;
						END IF;
					end if;
					if(track(3)='1') then
				if (who(3)='0') then
							if((VP>185 AND VP<285) AND(HP>90 AND HP<110)) THEN
								RGB<="100";
							elsif((VP>225 AND VP<245) AND(HP>50 AND HP<150)) THEN
								RGB<="100";
							END IF;
						ELSE
							if((VP>185 AND VP<285) AND(HP>50 AND HP<150)) THEN
								RGB<="010";
							elsif((VP>205 AND VP<265) AND(HP>70 AND HP<130)) THEN
								RGB<="000";
							END IF;
						END IF;
					end if;
					if(track(4)='1') then
				if (who(4)='0') then
							if((VP>185 AND VP<285) AND(HP>310 AND HP<330)) THEN
								RGB<="100";
							elsif((VP>225 AND VP<245) AND(HP>270 AND HP<370)) THEN
								RGB<="100";
							END IF;
						ELSE
							if((VP>185 AND VP<285) AND(HP>270 AND HP<370)) THEN
								RGB<="010";
							elsif((VP>205 AND VP<265) AND(HP>290 AND HP<350)) THEN
								RGB<="000";
							END IF;
						END IF;
					end if;
					if(track(5)='1') then
				if (who(5)='0') then
							if((VP>185 AND VP<285) AND(HP>530 AND HP<550)) THEN
								RGB<="100";
							elsif((VP>225 AND VP<245) AND(HP>490 AND HP<590)) THEN
								RGB<="100";
							END IF;
						ELSE
							if((VP>185 AND VP<285) AND(HP>490 AND HP<590)) THEN
								RGB<="010";
							elsif((VP>205 AND VP<265) AND(HP>510 AND HP<570)) THEN
								RGB<="000";
							END IF;
						END IF;
					end if;
					if(track(6)='1') then
				if (who(6)='0') then
							if((VP>350 AND VP<450) AND(HP>90 AND HP<110)) THEN
								RGB<="100";
							elsif((VP>390 AND VP<410) AND(HP>50 AND HP<150)) THEN
								RGB<="100";
							END IF;
						ELSE
							if((VP>350 AND VP<450) AND(HP>50 AND HP<150)) THEN
								RGB<="010";
							elsif((VP>370 AND VP<430) AND(HP>70 AND HP<130)) THEN
								RGB<="000";
							END IF;
						END IF;
					end if;
					if(track(7)='1') then
				if (who(7)='0') then
							if((VP>350 AND VP<450) AND(HP>310 AND HP<330)) THEN
								RGB<="100";
							elsif((VP>390 AND VP<410) AND(HP>270 AND HP<370)) THEN
								RGB<="100";
							END IF;
						ELSE
							if((VP>350 AND VP<450) AND(HP>270 AND HP<370)) THEN
								RGB<="010";
							elsif((VP>370 AND VP<430) AND(HP>290 AND HP<350)) THEN
								RGB<="000";
							END IF;
						END IF;
					end if;
					if(track(8)='1') then
				if (who(8)='0') then
							if((VP>350 AND VP<450) AND(HP>530 AND HP<550)) THEN
								RGB<="100";
							elsif((VP>390 AND VP<410) AND(HP>490 AND HP<590)) THEN
								RGB<="100";
							END IF;
						ELSE
							if((VP>350 AND VP<450) AND(HP>490 AND HP<590)) THEN
								RGB<="010";
							elsif((VP>370 AND VP<430) AND(HP>510 AND HP<570)) THEN
								RGB<="000";
							END IF;
						END IF;
					end if;		
			end if;
		else
				if((VP >200 and VP<210) and (HP>50   and   HP<90))then
					RGB <= "100"; -- WHITE
				elsif((VP >220 and VP< 230) and (HP>50   and   HP<90))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 230) and (HP>80   and   HP<90))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>50   and   HP<60))then
					RGB <= "100";   -- WHITE
				elsif((VP >240 and VP< 250) and (HP>100   and   HP<140))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>100   and   HP<110))then
					RGB <= "100";   -- WHITE
				elsif((VP >220 and VP< 230) and (HP>150   and   HP<190))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>150   and   HP<190))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>150   and   HP<160))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>180   and   HP<190))then
					RGB <= "100";   -- WHITE
				elsif((VP >220 and VP< 230) and (HP>200   and   HP<240))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 230) and (HP>200   and   HP<210))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 230) and (HP>230   and   HP<240))then
					RGB <= "100";   -- WHITE
				elsif((VP >230 and VP< 250) and (HP>220   and   HP<230))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>250   and   HP<260))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>250   and   HP<290))then
					RGB <= "100";   -- WHITE
				elsif((VP >240 and VP< 250) and (HP>250   and   HP<290))then
					RGB <= "100";   -- WHITE
				elsif((VP >220 and VP< 230) and (HP>250   and   HP<290))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>300   and   HP<310))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>300   and   HP<340))then
					RGB <= "100";   -- WHITE
				elsif((VP >220 and VP< 230) and (HP>300   and   HP<340))then
					RGB <= "100";   -- WHITE
				elsif((VP >230 and VP< 240) and (HP>310   and   HP<320))then
					RGB <= "100";   -- WHITE
				elsif((VP >240 and VP< 250) and (HP>320   and   HP<330))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 230) and (HP>330   and   HP<340))then
					RGB <= "100";   -- WHITE
				elsif(win1='1' and (VP >150 and VP< 300) and (HP>380   and   HP<420))then
								RGB <= "100";   -- WHITE
				elsif( win2='1' and (VP >150 and VP< 300) and (HP>380   and   HP<395))then
								RGB <= "100";   -- WHITE
				elsif( win2='1' and (VP >150 and VP< 300) and (HP>405   and   HP<420))then-------1
								RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>460   and   HP<470))then
					RGB <= "100";   -- WHITE
				elsif((VP >240 and VP< 250) and (HP>470   and   HP<475))then
					RGB <= "100";   -- WHITE
				elsif((VP >225 and VP< 250) and (HP>475   and   HP<485))then
					RGB <= "100";   -- WHITE
				elsif((VP >225 and VP< 235) and (HP>485   and   HP<495))then
					RGB <= "100";   -- WHITE
				elsif((VP >225 and VP< 250) and (HP>495   and   HP<505))then
					RGB <= "100";   -- WHITE
				elsif((VP >240 and VP< 250) and (HP>505   and   HP<510))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>510   and   HP<520))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>530   and   HP<540))then
					RGB <= "100";   -- WHITE
				elsif((VP >190 and VP< 250) and (HP>550   and   HP<560))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 210) and (HP>560   and   HP<590))then
					RGB <= "100";   -- WHITE
				elsif((VP >200 and VP< 250) and (HP>580   and   HP<590))then
					RGB <= "100";   -- WHITE
				else		
					RGB <= "000";   -- BLACK
				end if;
		end if;
end if;
end process;
endBehavioral;

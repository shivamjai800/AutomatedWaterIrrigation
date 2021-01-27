library ieee;
use ieee.std_logic_1164.all;
use work.CS254.all;

entity SensorElement is
	port (CLK : in std_logic;
		EXTRSTN : in std_logic;
		I0 : in std_logic;
		I1 : in std_logic;
		SensorSignal : in std_logic;
		Enable:in std_logic;
		output: out std_logic;
		output2: out std_logic);
end SensorElement;

architecture behaviour of SensorElement is
	signal clk_1 : integer range 0 to 70000000 :=0;
	signal count1:integer range 0 to 2:=0;
	signal count2:integer range 0 to 4:=0;
	signal count3:integer range 0 to 6:=0;
	signal count4:integer range 0 to 8:=0;
	signal internalreset: std_logic:='1';
	signal Trigger : std_logic:='0';
	signal Totalreset : std_logic:='0';
begin
	
	U0: TimeElement port map (clk,totalreset,i0,i1,Enable,output,output2);
	Process(clk)
		begin
			
			if(EXTRSTN='1') then
			totalreset<=(extRSTN or internalreset);
			count1<=0;
			count2<=0;
			count3<=0;
			count4<=0;
			Trigger <= '0';

			elsif(EXTRSTN='0') then
				if(CLK'event and CLK = '1' ) then
					totalreset<=(extRSTN or internalreset);
					if(sensorSignal = '1') then
						Trigger <= '1';
						if(count1=2 or count2=4 or count3=6 or count4 = 8) then
									count1<=0;
									count2<=0;
									count3<=0;
									count4<=0;
									internalreset<='1';
									trigger<='0';
						end if;
					else
						if(count1=2 or count2=4 or count3=6 or count4 = 8) then
							Trigger <= '0';
							internalreset<='1';
						end if;
					end if;
					if (clk_1=70000000) then
						clk_1<=0;
						if(trigger='1') then
								if(I0 ='0' and I1 = '0') then
									if(Count1<2) then
									count1<=count1+1;
									internalreset<='0';
									else
									internalreset<='1';
									end if;

								elsif(I0 ='0' and I1 = '1') then
									if(Count2<4) then
									count2<=count2+1;
									internalreset<='0';
									else
									internalreset<='1';
									end if;

								elsif(I0 ='1' and I1 = '0') then
									if(Count3<6) then
									count3<=count3+1;
									internalreset<='0';
									else
									internalreset<='1';
									end if;

								elsif(I0 ='1' and I1 = '1') then
									if(Count4<8) then
									count4<=count4+1;
									internalreset<='0';
									else
									internalreset<='1';
									end if;
								end if;
						end if;
						else
								if(internalreset='1' and sensorsignal = '0') then
									if(count1=2 or count2=4 or count3=6 or count4 = 8) then
										Trigger <= '0';
									end if;
									count1<=0;
									count2<=0;
									count3<=0;
									count4<=0;
								end if;
								clk_1<=clk_1+1;
						end if;
			end if;
		end if;
	end process;
	
end behaviour;
--- So, when sensor is sending signal to our device when rstn is pressed none will work till we have rstn = '1'


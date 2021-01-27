library ieee;
use ieee.std_logic_1164.all;


entity TimeElement is
	port (CLK : in std_logic;
	RSTN : in std_logic;
	I0 : in std_logic;
	I1 : in std_logic;
	Enable:in std_logic;
	output: out std_logic;
	output2: out std_logic );
end TimeElement;

architecture behaviour of TimeElement is

TYPE STATE_TYPE is (S0,S1,S2,S3,IDLE);
signal Q,QPLUS: STATE_TYPE;
signal clk_1 : integer range 0 to 50000000 :=0;
signal count1:integer range 0 to 2:=0;
signal count2:integer range 0 to 4:=0;
signal count3:integer range 0 to 6:=0;
signal count4:integer range 0 to 8:=0;



begin
process(Q)
	begin
		case Q is
		
			when S0=>
			
			if(count1<2) then
			output<='1';
			output2<='1';
			end if;
			
			when S1=>
			
			if(count2<4) then
			output<='1';
			output2<='1';
			end if;
			
			
			when S2=>
			
			if(count3<6) then
			output<='1';
			output2<='1';
			end if;
			
			
			when S3=>
			
			if(count4<8) then
			output<='1';
			output2<='1';
			end if;
			
			
			when IDLE=>
			output<='0';
			output2<='0';
			
			when others=>
			output<='0';
			output2<='0';
	end case;
end process;
process(clk, RSTN, I0,I1)
begin
	if(Enable='0') then
		Q<=IDLE;
	
	else
		if(RSTN='1') then

		count1<=0;
		count2<=0;
		count3<=0;
		count4<=0;
		Q<= IDLE;

	elsif(RSTN='0') then

		if(CLK'event and CLK = '1' ) then
			if (clk_1=50000000) then
				clk_1<=0;
				if(I0 ='0' and I1 = '0') then
					if(Count1<2) then
					count1<=count1+1;
					Q<=S0;
					else
					Q<=IDLE;
					end if;

				elsif(I0 ='0' and I1 = '1') then
					if(Count2<4) then
					count2<=count2+1;
					Q<=S1;
					else
					Q<=IDLE;
					end if;

				elsif(I0 ='1' and I1 = '0') then
					if(Count3<6) then
					count3<=count3+1;
					Q<=S2;
					else
					Q<=IDLE;
					end if;

				elsif(I0 ='1' and I1 = '1') then
					if(Count4<8) then
					count4<=count4+1;
					Q<=S3;
					else
					Q<=IDLE;
					end if;

				end if;
				else
					clk_1<=clk_1+1;
				end if;
			end if;
		end if;
	end if;
	end process;
end behaviour;



library ieee;
use ieee.std_logic_1164.all;

package CS254 is

component TimeElement is
	port (CLK : in std_logic;
	RSTN : in std_logic;
	I0 : in std_logic;
	I1 : in std_logic;
	Enable:in std_logic;
	output: out std_logic;
	output2: out std_logic);
end component;

component NOT_1 is
	port(I0 :in std_logic;
		  O0 :out std_logic); 
end component;

component and_1 is
	port(I0 :in std_logic;
		  I1 :in std_logic;
		  O0 :out std_logic); 
end component;

component or_1 is
	port(I0 :in std_logic;
		  I1 :in std_logic;
		  O0 :out std_logic); 
end component;

component NAND_1 is
	port(I0 :in std_logic;
		  I1 :in std_logic;
		  O0 :out std_logic); 
end component;

component NOR_1 is
	port(I0 :in std_logic;
		  I1 :in std_logic;
		  O0 :out std_logic); 
end component;

component XOR_1 is
	port(I0 :in std_logic;
		  I1 :in std_logic;
		  O0 :out std_logic); 
end component;

component Half_Adder is
	port(I0 :in std_logic;
		  I1 :in std_logic;
		  O0 :out std_logic;
		  O1 :out std_logic); 
end component;

component Full_Adder is
	port(I0 :in std_logic;
		  I1 :in std_logic;
		  Cin :in std_logic;
		  sum :out std_logic;
		  Cout :out std_logic); 
end component;

component mux_2 is
	port(S :in std_logic;
		  A,B :in std_logic;
		  O0 :out std_logic); 
end component;

component mux_4 is
	port(X0,X1,X2,X3 :in std_logic;
		  S0 :in std_logic;
		  S1 : in std_logic;
		  Y :out std_logic);
end component;

component mux_16 is
	port(A :in std_logic_vector( 3 downto 0);
		  B :in std_logic_vector( 3 downto 0);
		  C :in std_logic_vector( 3 downto 0);
		  D:in std_logic_vector( 3 downto 0);
		  S0 :in std_logic;
		  S1 : in std_logic;
		  Y :out std_logic_vector( 3 downto 0));
end component;

component shifter is
	port(A :in std_logic_vector( 3 downto 0);
		  s :in std_logic_vector( 1 downto 0);
		  d :in std_logic;
		  Y :out std_logic_vector( 3 downto 0));
end component;

component four_adder is
	port(A0 :in std_logic;
		  A1 :in std_logic;
		  A2 :in std_logic;
		  A3 :in std_logic;
		  B0 :in std_logic;
		  B1 :in std_logic;
		  B2 :in std_logic;
		  B3 :in std_logic;
		  sum0 :out std_logic;
		  sum1 :out std_logic;
		  sum2 :out std_logic;
		  sum3 :out std_logic;
		  Cout :out std_logic); 
end component;

component four_s is
	port(A0 :in std_logic;
		  A1 :in std_logic;
		  A2 :in std_logic;
		  A3 :in std_logic;
		  B0 :in std_logic;
		  B1 :in std_logic;
		  B2 :in std_logic;
		  B3 :in std_logic;
		  sum0 :out std_logic;
		  sum1 :out std_logic;
		  sum2 :out std_logic;
		  sum3 :out std_logic;
		  Cout :out std_logic); 
end component;

component ALU is
	port(A,B : in std_logic_vector(3 downto 0);
			S : in std_logic_vector(2 downto 0);
			F : out std_logic_vector(3 downto 0);
			X : out std_logic 
			); 
end component;

component mux_8 is
	port(A : in std_logic_vector(3 downto 0);
	     B : in std_logic_vector(3 downto 0);
		  c : in std_logic;
		  Y : out std_logic_vector(3 downto 0));
end component;


component xas is
	port(A, B : in std_logic_vector(3 downto 0); 
			x : in std_logic;
			Y : out std_logic_vector(7 downto 0)); 

end component;


component sevensegment is 
port(	X : in std_logic_vector(3 downto 0); 
		Y : out std_logic_vector(6 downto 0); 
		F : out std_logic); 
		
end component;



component D_FF_2 is -- Entity declaration
	port(
			D : in std_logic; -- Data input of the D flipflop
			CLK : in std_logic; -- Clock input of the D flipflop
			PREN : in std_logic; -- Preset input of the D flipflop
			CLRN : in std_logic; -- Clear input of the D flipflop
			Q : buffer std_logic; -- Q output of the D flipflop
			QN : out std_logic); -- Q_bar output of the D flipflop
end component;


component upcounter is -- Entity declaration
		port(
				CLK : in std_logic; -- Clock input of the counter
				RSTN : in std_logic; -- Active low reset input of the counter
				Q : inout std_logic_vector(3 downto 0)
	); -- Output of the counter
end component;

component COUNTERSYNC is -- Entity declaration
	port(
	CLK : in std_logic; -- Clock input of the counter
	EN : in std_logic; -- Enable input of the counter
	RSTN : in std_logic; -- Active low reset input of the counter
	LDN : in std_logic; -- Active low load input of the counter
	D : in std_logic_vector(3 downto 0); -- Value to be assigned to the counter
	C : out std_logic; -- Carry output from the counter
	Q : inout std_logic_vector(3 downto 0)); -- Output of the counter
end component;

component bcdupcounter is -- Entity declaration
	port(
			CLK : in std_logic; -- Clock input of the counter
			RSTN : in std_logic; -- Active low reset input of the counter
			Q : inout std_logic_vector(3 downto 0)); -- Output of the counter
end component;

component latch_2 is -- Entity declaration
	port(
		D : in std_logic; -- Data input of the latch
		CLK : in std_logic; -- Clock input of thelatch
		Q : buffer std_logic; -- Q output of the  latch
		QN : out std_logic); -- Q_bar output of the latch

end component;


component latchbank is -- Entity declaration
		port(
				CLK : in std_logic; 
				Q : in std_logic_vector(3 downto 0);
				O : out std_logic_vector(3 downto 0)
		); -- Output of the counter
end component;

component latchbank_16 is -- Entity declaration
		port(
				DIG0,DIG1 : in std_logic; 
				Q : in std_logic_vector(3 downto 0);
				a: out std_logic_vector(3 downto 0);
				b: out std_logic_vector(3 downto 0);
				c: out std_logic_vector(3 downto 0);
				d: out std_logic_vector(3 downto 0)
		); -- Output of the counter
end component;

component clock_4 is -- Entity declaration
	port(
			CLK : in std_logic; -- Clock input of the counter
			RSTN : in std_logic; -- Active low reset input of the counter
			Q : inout std_logic_vector(1 downto 0)
	); -- Output of the counter
end component;

component BCDCOUNTERSYNC is -- Entity declaration
	port(
	CLK : in std_logic; -- Clock input of the counter
	EN : in std_logic; -- Enable input of the counter
	RSTN : in std_logic; -- Active low reset input of the counter
	LDN : in std_logic; -- Active low load input of the counter
	D : in std_logic_vector(3 downto 0); -- Value to be assigned to the counter
	C : out std_logic; -- Carry output from the counter
	Q : inout std_logic_vector(3 downto 0)); -- Output of the counter
end component;

end CS254;

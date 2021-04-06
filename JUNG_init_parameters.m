nulltime=-149;

global P0

% initial values
Y(1)=0;      % CyclinB1
Y(2)=1;      % CDK1, CDK1T
Y(3)=0;      % MPF
Y(4)=0;      % preMPF
Y(5)=0;      % p21
Y(6)=0;      % p21:MPF
Y(7)=0;      % Cdc25P
Y(8)=1;      % Cdc25, Cdc25T
Y(9)=1;      % Wee1, Wee1T
Y(10)=0;     % Wee1P
Y(11)=0;     % Plk1P
Y(12)=1;     % Plk1, Plk1T
Y(13)=1;     % PPase
Y(14)=0;     % PPaseP
Y(15)=1;     % APC, APCT
Y(16)=0;     % APCP
Y(17)=1;     % Cdc20
Y(18)=0;     % Cdc20P, Cdc20T
Y(19)=0;     % APCP:Cdc20
Y(20)=1;     % Cdh1
Y(21)=0;     % Cdh1P, Cdh1T
Y(22)=0;     % APC:Cdh1
Y(23)=0;     % APCP:Cdh1
Y(24)=1;     % Pttg1
Y(25)=0;     % Pttg1P, Pttg1T
Y(26)=0;     % LMNAP
Y(27)=0;     % ATM:ATR
Y(28)=0;     % p53
Y(29)=0;     % p53P
Y(30)=0;     % p53P_Plk1P
Y(31)=0;     % Mdm2
Y(32)=0;     % Wip1
Y(33)=1;     % Mad2
Y(34)=0;     % Mad2l1:Cdc20P


% parameters
P0(1)=18;        %Forward rate constant for association of CyclinB and CDK1  
P0(2)=0.1;       %Backward rate constant for dissociation of MPF  (h^-1)
P0(3)=10;         %Dephosphorylation rate constant of preMPF by Cdc25P  %10
P0(4)=0.2;       %Dephosphorylation rate constant of preMPF by Cdc25  %0.2
P0(5)=3;         %Phosphorylation rate constant of MPF by Wee1 %3
P0(6)=0.1;       %Phosphorylation rate constant of MPF by Wee1P  %0.1
P0(7)=1;         %Phosphorylation rate constant of Cdc25 by MPF  %1
P0(8)=2;         %Phosphorylation rate constant of Cdc25 by Plk1P %2
P0(9)=0.54;      %Dephosphorylation rate constant of Cdc25P by PP2A %0.54
P0(10)=1;        %Phosphorylation rate constant of Wee1 by MPF  %1
P0(11)=2;        %Phosphorylation rate constant of Wee1P by Plk1P  %2
P0(12)=0.2;      %Dephosphorylation rate constant of Wee1P by PP2A %0.2
P0(13)=8;        %Forward rate constant for dissociation of p21:MPF(micro M^-1h^-1) 
P0(14)=80;       %Backward rate constant for association of p21 and MPF(h^-1) 
P0(15)=5;        %Phosphorylation rate constant of Plk1 by MPF %5
P0(16)=0.5;      %Dephosphorylation rate constant of Plk1P by PPase %0.5
P0(17)=0.4;      %Dephosphorylation rate constant of PP2AP  %0.4
P0(18)=4;        %Phosphorylation rate constant of PP2A by MPF %4
P0(19)=0.1;      %Phosphorylation rate constant of APC by MPF   %0.1
P0(20)=0.35;     %Phosphorylation rate constant of APC by Plk1P %0.35 
P0(21)=0.04;     %Dephosphorylation rate constant of APCP by PP2A
P0(22)=11;       %Phosphorylation rate constant of Cdc20 by MPF   %12
P0(23)=11;       %Phosphorylation rate constant of Cdc20 by Plk1P  %12
P0(24)=20;       %Dephosphorylation rate constant of Cdc20 by PP2A  %20
P0(25)=80;       %Forward rate constant for association of APCP and Cdc20  
P0(26)=20;       %Backward rate constant for dissociation of APCP:Cdc20   
P0(27)=0.01;     %Dephosphorylation rate constant of Cdh1P by PP2A  0.01 
P0(28)=22;       %Phosphorylation rate constant of Cdh1 by MPF %24
P0(29)=22;       %Phosphorylation rate constant of Cdh1 by Plk1P  %24
P0(30)=80;       %Forward rate constant for association of APC and Cdh1 
P0(31)=20;       %Backward rate constant for dissociation of APC:Cdh1 
P0(32)=80;       %Forward rate constant for association of APCP and Cdh1 
P0(33)=3;        %Backward rate constant for dissociation of APCP:Cdh1    
P0(34)=0.01;     %Dephosphorylation rate constant of Pttg1P by PPase 0.01
P0(35)=50;       %Phosphorylation rate constant of Pttg1 by MPF 50
P0(36)=1;        %Phosphorylation rate constant of  LMNA  by MPF  %1
P0(37)=1;        %Dephosphorylation rate constant of LMNAP %1
P0(38)=1;        %Phosphorylation rate constant of p53 by ATM_ATR %1
P0(39)=3;        %Dephosphorylation rate constant of p53P by WIP1 %3
P0(40)=80;       %Forward rate constant for association of Plk1P and p53P 
P0(41)=20;       %Backward rate constant for dissociation of p53P:Plk1P 
P0(42)=20;       %Forward rate constant for association of Mad2 and Cdc25P 20
P0(43)=10;       %Backward rate constant for dissociation of MAD2_Cdc25P 10

P0(44)=0.1;      %Cyclin synthesis rate constant  %0.1
P0(45)=0.1;      %p21 synthesis rate constant influence by p53
P0(46)=0.1;      %Cdc25 synthesis rate constant
P0(47)=0.1;      %Wee1 synthesis rate constant
P0(48)=0.1;      %Plk1 synthesis rate constant  
P0(49)=0.1;      %PP2A synthesis rate constant
P0(50)=0.1;      %APC synthesis rate constant  
P0(51)=0.1;      %Cdc20 synthesis rate constant  
P0(52)=0.1;      %Cdh1 synthesis rate constant  
P0(53)=0.1;      %Pttg1 synthesis rate constant
P0(54)=0.1;      %ATM_ATR synthesis rate constant by DNA damage  
P0(55)=0.5;      %p53 synthesis rate constant influenced by ATM_ATR %0.5
P0(56)=0.0001;   %Mdm2 synthesis rate constant  
P0(57)=6;        %p53P-dependent Mdm2 synthesis rate constant  %6
P0(58)=0.0001;   %Wip1 synthesis rate constant
P0(59)=6;        %p53P-dependent Wip1 synthesis rate constant  %4
P0(60)=0.1;      %Mad2 synthesis rate constant 

P0(61)=0.3;      %CyclinB self-degradation rate constant 
P0(62)=1;        %CyclinB degradation rate constant by APCP:Cdc20
P0(63)=1;        %CyclinB degradation rate constant by APC:Cdh1T
P0(64)=0.01;     %MPF self-degradation rate constant %0.01
P0(65)=1;        %MPF degradation rate constant by APCP:Cdc20
P0(66)=1;        %MPF degradation rate constant by APC:Cdh1T
P0(67)=0.01;     %preMPF self-degradation rate constant %0.01
P0(68)=1;        %preMPF degradation rate constant by APCP:Cdc20
P0(69)=1;        %preMPF degradation rate constant by APC:Cdh1T
P0(70)=1;        %p21 self-degradation rate constant 
P0(71)=1;        %p21:MPF(p21)degradation rate constant by APCP:Cdc20  %0.001
P0(72)=0.18;     %Cdc25P self-degradation rate constant  %0.18
P0(73)=0.1;      %cdc25CP degradation rate constant by APCT:CDH1 %0.1
P0(74)=0.08;     %Cdc25 self-degradation rate constant 0.08%
P0(75)=1;        %cdc25C degradation rate constant by APCT:CDH1 %0.1
P0(76)=0.1;      %Wee1 self-degradation rate constant 
P0(77)=1;        %Wee1P self-degradation rate constant 
P0(78)=0.1;      %Plk1P self-degradation rate constant %0.1
P0(79)=1.5;      %Plk1P degradation rate constant  by APC:Cdh1T %1.5
P0(80)=0.2;      %Plk1 self-degradation rate constant %0.2
P0(81)=1.5;        %Plk1 degradation rate constant  by APC:Cdh1T  %1.5
P0(82)=0.1;        %PPase self-degradtion rate constant 
P0(83)=0.1;        %PPaseP self-degradation rate constant 
P0(84)=0.2;        %APC self-degradation rate constant 
P0(85)=0.1;        %APCP self-degradation rate constant 
P0(86)=0.2;         %Cdc20 self-degradation rate constant 
P0(87)=1.5;           %Cdc20 degradation rate constant by APC:Cdh1T %1.5
P0(88)=0.2;         %Cdc20P self-degradation rate constant 0.2
P0(89)=1.5;           %Cdc20P degradation rate constant   by APC:Cdh1T %1.5
P0(90)=0.2;         %Cdh1 self-degradation rate constant  %0.2
P0(91)=0.2;         %Cdh1P self-degradation rate constant %0.2
P0(92)=0.1;         %pttg1 self-degradation rate constant   %0.1
P0(93)=1;           %pttg1 degradation rate constant by APCP:CdC20 %1
P0(94)=0.1;         %pttg1P self-degradation rate constant  %0.1
P0(95)=1;           %pttg1P degradation rate constant by APCP:CdC20 %1
P0(96)=0.1;         %ATM_ATR degradation rate constant  %0.1
P0(97)=100;          %Saturating Wip1-dependent ATM_ATR degradation rate %200
P0(98)=0.2;         %p53 degradation rate constant%0.2
P0(99)=1;           %Mdm2-dependent p53 degradation rate %1
P0(100)=0.2;        %p53P degradation rate constant%0.2
P0(101)=1;          %Mdm2-dependent p53P degradation rate 1
P0(102)=1;         %ATM-ATR dependent Mdm2 inactivaton rate  %1
P0(103)=0.2;        %Mdm2 degradation rate constant  %0.2
P0(104)=5;          %Wip1 degradation rate constant  %5
P0(105)=0.2;        %Mad2 degradation rate constant  0.2

P0(106)=1;          %Intensifying rate in kf6p by ATM_ATR  1
P0(107)=0.5;        %Intensifying  rate in of kf11p by pttg1  1
P0(108)=1;          %Intensifying  rate in ks8 by ATM_ATR  1
P0(109)=0.001;      %Reduction rate of ks5 for returning to normal %0.001
P0(110)=0.001;      %Reduction rate of ks27 for returning to normal %0.005 
P0(111)=0.0002;      %Reduction rate of ks28 for returning to normal %0.002
P0(112)=0.01;       %Reduction rate of Mad2_Cdc20P dissociation by p21 %0.01
P0(113)=1;          %Ratio of Plk1:p21   %1

P0(114)=0.1;       %Michaelis-Menten constant of CyclinB11(APCP:Cdc20)
P0(115)=0.1;       %Michaelis-Menten constant of CyclinB12(APCP:Cdh1)
P0(116)=0.1;       %Michaelis-Menten constant of MPF(APCP:Cdc20)
P0(117)=0.1;       %Michaelis-Menten constant of MPF(APCP:Cdh1)
P0(118)=0.1;       %Michaelis-Menten constant of preMPF(APCP:Cdc20)
P0(119)=0.1;       %Michaelis-Menten constant of preMPF(APCP:Cdh1)
P0(120)=0.1;       %Michaelis-Menten constant of p21:MPF(p21)degradation by APCP:Cdc20
P0(121)=0.1;       %Michaelis-Menten constant of Cdc25P dephosphorylation
P0(122)=0.1;       %Michaelis-Menten constant of Cdc25P degradation by APC/CT:CDH1	
P0(123)=0.1;       %Michaelis-Menten constant of Cdc25 degradation by APC/CT:CDH1
P0(124)=0.1;       %Michaelis-Menten constant of Wee1P dephosphorylation
P0(125)=0.1;       %Michaelis-Menten constant of Plk1P dephosphorylation
P0(126)=0.1;       %Michaelis-Menten constant of Plk1 degradation by APC:Cdh1T
P0(127)=0.1;       %Michaelis-Menten constant of Plk1P degradation by APC:Cdh1T
P0(128)=0.1;       %Michaelis-Menten constant of APCP dephosphorylation
P0(129)=0.1;       %Michaelis-Menten constant of Cdc20P dephosphorylation
P0(130)=0.1;       %Michaelis-Menten constant of Cdc20 degradation by APC:Cdh1T
P0(131)=0.1;       %Michaelis-Menten constant of Cdc20P degradation by APC:Cdh1T
P0(132)=0.1;       %Michaelis-Menten constant of Cdh1P dephosphorylation
P0(133)=0.1;       %Michaelis-Menten constant of Pttg1P dephosphorylation
P0(134)=0.1;       %Michaelis-Menten constant of Pttg1 degradation by APCP:CdC20
P0(135)=0.1;       %Michaelis-Menten constant of Pttg1P degradation by APCP:CdC20
P0(136)=0.5;       %Michaelis-Menten constant of p53 phosphorylation by Wip1 
P0(137)=0.5;       %Michaelis-Menten constant of ATM_ATR signal degradation by Wip1 











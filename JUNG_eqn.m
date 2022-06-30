
%---------------------------------------------------------------------------------------
% Code Builder: Yongwoon Jung
% Fully hybrid model for mitotic cell cycle regulation.
% Last modified: 4/5/2021
% function : Jung_eqn.m, JUNG_init_parameters, JUNG_constant_variables
% main program : JUNG_Fig2_main.m
% 34 initial values, 137 parametes
%---------------------------------------------------------------------------------------
function dY=JUNG_eqn(t,Y)

global P0

% initial values
CyclinB1=Y(1);
CDK1=Y(2);
MPF=Y(3);
preMPF=Y(4);
p21=Y(5);
p21_MPF=Y(6);
Cdc25P=Y(7);
Cdc25=Y(8);
Wee1=Y(9);
Wee1P=Y(10);
Plk1P=Y(11);
Plk1=Y(12);
PPase=Y(13);
PPaseP=Y(14);
APC=Y(15);
APCP=Y(16);
Cdc20=Y(17);
Cdc20P=Y(18);
APCP_Cdc20=Y(19);
Cdh1=Y(20);
Cdh1P=Y(21);
APC_Cdh1=Y(22);
APCP_Cdh1=Y(23);
Pttg1=Y(24);
Pttg1P=Y(25);
LMNAP=Y(26);
ATM_ATR=Y(27);
p53=Y(28);
p53P=Y(29);
p53P_Plk1P=Y(30);
Mdm2= Y(31);
Wip1= Y(32);
Mad2=Y(33);
Mad2_Cdc20P=Y(34);

% parameters
kf1=P0(1);          %Forward rate constant for association of CyclinB and CDK1  %4
kr1=P0(2);          %Backward rate constant for dissociation of MPF
kf2p=P0(3);         %Dephosphorylation rate constant of preMPF by Cdc25P
kf2pp=P0(4);        %Dephosphorylation rate constant of preMPF by Cdc25
kr2p=P0(5);         %Phosphorylation rate constant of MPF by Wee1
kr2pp=P0(6);        %Phosphorylation rate constant of MPF by Wee1P
kf3p=P0(7);         %Phosphorylation rate constant of Cdc25 by MPF
kf3pp=P0(8);        %Phosphorylation rate constant of Cdc25 by Plk1P
kr3p=P0(9);         %Dephosphorylation rate constant of Cdc25P by PPase
kf4p=P0(10);        %Phosphorylation rate constant of Wee1 by MPF
kf4pp=P0(11);       %Phosphorylation rate constant of Wee1 by Plk1P
kr4p=P0(12);        %Dephosphorylation rate constant of Wee1 by PPase
kf5=P0(13);         %Forward rate constant for dissociation of p21:MPF (micro M^-1h^-1)
kr5=P0(14);         %Backward rate constant for association of p21 and MPF (h^-1)
kf6p=P0(15);        %Phosphorylation rate constant of Plk1 by MPF
kr6p=P0(16);        %Dephosphorylation rate constant of Plk1P by PPase
kf7=P0(17);         %Dephosphorylation rate constant of PPaseP
kr7p=P0(18);        %Phosphorylation rate constant of PPase by MPF
kf8p=P0(19);        %Phosphorylation rate constant of APC by MPF
kf8pp=P0(20);       %Phosphorylation rate constant of APC by Plk1P
kr8p=P0(21);        %Dephosphorylation rate constant of APCP by PPase
kr9p=P0(22);        %Phosphorylation rate constant of Cdc20 by MPF
kr9pp=P0(23);       %Phosphorylation rate constant of Cdc20 by Plk1P
kf9p=P0(24);        %Dephosphorylation rate constant of Cdc20 by PPase
kf10=P0(25);        %Forward rate constant for association of APCP and Cdc20
kr10=P0(26);        %Backward rate constant for dissociation of APCP:Cdc20
kf11p=P0(27);       %Dephosphorylation rate constant of Cdh1P by PPase
kr11p=P0(28);       %Phosphorylation rate constant of Cdh1 by MPF
kr11pp=P0(29);      %Phosphorylation rate constant of Cdh1 by Plk1P
kf12=P0(30);        %Forward rate constant for association of APC and Cdh1 
kr12=P0(31);        %Backward rate constant for dissociation of APC:Cdh1 
kf13=P0(32);        %Forward rate constant for association of APCP and Cdh1 
kr13=P0(33);        %Backward rate constant for dissociation of APCP:Cdh1    
kf14p=P0(34);       %Dephosphorylation rate constant of pttg1P by PPase
kr14p=P0(35);       %Phosphorylation rate constant of pttg1 by MPF
kf15p=P0(36);       %Phosphorylation rate constant of LMNA by MPF
kr15=P0(37);        %Dephosphorylation rate constant of LMNAP

kf16p=P0(38);       %Phosphorylation rate constant of p53 by ATM_ATR
kr16p=P0(39);       %Dephosphorylation rate constant of p53P by WIP1
kf17=P0(40);        %Forward rate constant for association of Plk1P and p53P 
kr17=P0(41);        %Backward rate constant for dissociation of p53P:Plk1P        
kf18=P0(42);        %Forward rate constant for association of Mad2 and cdc25CP 
kr18p=P0(43);       %Backward rate constant for dissociation of MAD2_cdc25CP 

ks1=P0(44);         %Cyclin synthesis rate constant
ks5=P0(45);         %p21 synthesis rate constant
ks8=P0(46);         %Cdc25 synthesis rate constant
ks9=P0(47);         %Wee1 synthesis rate constant
ks12=P0(48);        %Plk1 synthesis rate constant
ks13=P0(49);        %PPase synthesis rate constant
ks15=P0(50);        %APC synthesis rate constant
ks17=P0(51);        %Cdc20 synthesis rate constant
ks20=P0(52);        %Cdh1 synthesis rate constant  
ks24=P0(53);        %pttg1 synthesis rate constant
ks27=P0(54);        %ATM_ATR synthesis rate constant  
ks28=P0(55);        %p53 synthesis rate constant
ks31=P0(56);        %Mdm2 synthesis rate constant  
ks31p=P0(57);       %p53P-dependent Mdm2 synthesis rate constant
ks32=P0(58);        %Wip1 synthesis rate constant
ks32p=P0(59);       %p53P-dependent Wip1 synthesis rate constant
ks33=P0(60);        %Mad2 synthesis rate constant  0.1

kd1p1=P0(61);       %CyclinB self-degradation rate constant 
kd1p2=P0(62);       %CyclinB degradation rate constant by APCP:Cdc20
kd1p3=P0(63);       %CyclinB degradation rate constant by APC:Cdh1T
kd3p1=P0(64);       %MPF self-degradation rate constant 
kd3p2=P0(65);       %MPF degradation rate constant by APCP:Cdc20
kd3p3=P0(66);       %MPF degradation rate constant by APC:Cdh1T
kd4p1=P0(67);       %preMPF self-degradation rate constant 
kd4p2=P0(68);       %preMPF degradation rate constant by APCP:Cdc20
kd4p3=P0(69);       %preMPF degradation rate constant by APC:Cdh1T
kd5=P0(70);         %p21 self-degradation rate constant 
kd6=P0(71);         %p21:MPF(p21)degradation rate constant by APCP:Cdc20  %0.001
kd7p1=P0(72);       %Cdc25P self-degradation rate constant 
kd7p3=P0(73);       %cdc25CP degradation rate constant by APCT:CDH1
kd8p1=P0(74);       %Cdc25 self-degradation rate constant 
kd8p3=P0(75);       %cdc25C degradation rate constant by APCT:CDH1
kd9=P0(76);         %Wee1 self-degradation rate constant 
kd10=P0(77);        %Wee1P self-degradation rate constant 
kd11p1=P0(78);      %Plk1P self-degradation rate constant 
kd11p3=P0(79);      %Plk1P degradation rate constant  by APC:Cdh1T 
kd12p1=P0(80);      %Plk1 self-degradation rate constant 
kd12p3=P0(81);      %Plk1 degradation rate constant  by APC:Cdh1T
kd13=P0(82);        %PPase self-degradtion rate constant 
kd14=P0(83);        %PPaseP self-degradation rate constant 
kd15=P0(84);        %APC self-degradation rate constant 
kd16=P0(85);        %APCP self-degradation rate constant 
kd17p1=P0(86);      %Cdc20 self-degradation rate constant 
kd17p3=P0(87);      %Cdc20 degradation rate constant by APC:Cdh1T
kd18p1=P0(88);      %Cdc20P self-degradation rate constant 
kd18p3=P0(89);      %Cdc20P degradation rate constant   by APC:Cdh1T
kd20=P0(90);        %Cdh1 self-degradation rate constant  
kd21=P0(91);        %Cdh1P self-degradation rate constant 
kd24p1=P0(92);      %pttg1 self-degradation rate constant 
kd24p2=P0(93);      %pttg1 degradation rate constant by APCP:CdC20
kd25p1=P0(94);      %pttg1P self-degradation rate constant 
kd25p2=P0(95);      %pttg1P degradation rate constant by APCP:CdC20
kd27=P0(96);        %ATM_ATR degradation rate constant  
kd27p=P0(97);       %Saturating Wip1-dependent ATM_ATR degradation rate
kd28=P0(98);        %p53 degradation rate constant
kd28p=P0(99);       %Mdm2-dependent p53 degradation rate
kd29=P0(100);        %p53P degradation rate constant
kd29p=P0(101);       %Mdm2-dependent p53P degradation rate

kd31p1=P0(102);        %ATM-ATR dependent Mdm2 inactivaton rate
kd31=P0(103);        %Mdm2 degradation rate constant
kd32=P0(104);        %Wip1 degradation rate constant
kd33=P0(105);        %Mad2 degradation rate constant  0.2

KA1=P0(106);         %Amplication factor of kf6p by ATM_ATR 
KPttg11=P0(107);     %Amplication factor of kf11p by pttg1  
KA2=P0(108);         %Amplication factor of ks8 by ATM_ATR  
Kp53=P0(109);        %Amplication factor of ks5 by p53
KDDS=P0(110);        %Amplication factor of ks27 by DDS  
KA3=P0(111);         %Amplication factor of ks28 by ATM_ATR
KMCD=P0(112);        %Amplication factor of Mad2_Cdc20P dissociation by p21 
Epsilon=P0(113);     %Ratio of Plk1:p21

KCyclinB11=P0(114); %Michaelis-Menten constant of CyclinB1(APCP:Cdc20)
KCyclinB12=P0(115); %Michaelis-Menten constant of CyclinB2(APCP:Cdh1)
KMPF1=P0(116);      %Michaelis-Menten constant of MPF(APCP:Cdc20)
KMPF2=P0(117);      %Michaelis-Menten constant of MPF(APCP:Cdh1)
KpreMPF1=P0(118);   %Michaelis-Menten constant of MPF(APCP:Cdc20)
KpreMPF2=P0(119);   %Michaelis-Menten constant of MPF(APCP:Cdh1)
Kp21MPF=P0(120);    %Michaelis-Menten constant of p21:MPF(p21)degradation by APCP:Cdc20 
KCdc25P1=P0(121);   %Michaelis-Menten constant of Cdc25P dephosphorylation
KCdc25P2=P0(122);   %Michaelis-Menten constant of cdc25CP degradation by APC/CT:CDH1	
KCdc25=P0(123);     %Michaelis-Menten constant of cdc25C degradation by APC/CT:CDH1	
KWee1P=P0(124);     %Michaelis-Menten constant of Wee1P dephosphorylation
KPlk1P1=P0(125);    %Michaelis-Menten constant of Plk1P dephosphorylation by PPase
KPlk1P2=P0(126);    %Michaelis-Menten constant of Plk1P degradation by APC:Cdh1T
KPlk1=P0(127);      %Michaelis-Menten constant of Plk1 degradation by APC:Cdh1T
KAPCP=P0(128);      %Michaelis-Menten constant of APCP dephosphorylation by PPase 
KCdc20P1=P0(129);   %Michaelis-Menten constant of Cdc20P dephosphorylation by PPase
KCdc20=P0(130);     %Michaelis-Menten constant of Cdc20 degradation by APC:Cdh1T
KCdc20P2=P0(131);   %Michaelis-Menten constant of Cdc20P degradation by APC:Cdh1T
KCdh1P=P0(132);     %Michaelis-Menten constant of Cdh1P dephosphorylation
KPttg1P1=P0(133);   %Michaelis-Menten constant of pttg1P dephosphorylation
KPttg1=P0(134);     %Michaelis-Menten constant of pttg1 degradation by APCP:CdC20
KPttg1P2=P0(135);   %Michaelis-Menten constant of pttg1P degradation by APCP:CdC20 
KATMATR=P0(136);    %Michaelis-Menten constant of p53 phosphorylation by Wip1 
KWip1=P0(137);      %Michaelis-Menten constant of ATM_ATR signal degradation by Wip1 


ASP=0.6;              % Apoptos Starting Point 0.6
DSP=0.36;              % Damage Starting Point 0.36

if Mad2_Cdc20P > ASP   
    DDS=200*(Mad2_Cdc20P-ASP);
elseif Mad2_Cdc20P > DSP 
    DDS=200*(Mad2_Cdc20P-DSP);
else
    DDS=0;
end
% Signallin0g variables relating DNA damage

sig = DDS*exp(-0.00000001*t);

% Equations
N1=3;  % Hill coefficient of p21 reacting with MPF 
N2=4;  % Hill coefficient of p53P production by ATM_ATR signal 
N3=4;  % Hill coeeficient of ATM_ATR signal degradation by Wip1  
LMNAT=1;
kf2=kf2p*Cdc25P+kf2pp*Cdc25;
kr2=kr2p*Wee1+1*kr2pp*Wee1P;
kf3=kf3p*MPF+kf3pp*Plk1P;
kr3=kr3p*PPase;
kf4=kf4p*MPF+kf4pp*Plk1P;
kr4=kr4p*PPase;
kf6=kf6p*MPF*KA1/(KA1+ATM_ATR);
kr6=kr6p*PPase;
kr7=kr7p*MPF;
kf8=kf8p*MPF+kf8pp*Plk1P;
kr8=kr8p*PPase;
kf9=kf9p*PPase;
kr9=kr9p*MPF+kr9pp*Plk1P;
kf11=kf11p*PPase*KPttg11/(KPttg11+Pttg1);
kr11=kr11p*MPF+kr11pp*Plk1P;
kf14=kf14p*PPase;
kr14=kr14p*MPF;
kf15=kf15p*MPF;
kf16=kf16p*ATM_ATR^N3/(KATMATR^N3+ATM_ATR^N3);
kr16=kr16p*Wip1;
kr18=kr18p*Mad2_Cdc20P*(1+p21/KMCD+ Epsilon*Plk1P/KMCD)
LMNA=LMNAT-LMNAP;


% ODEs
dCyclinB1=ks1-kf1*CyclinB1*CDK1+kr1*MPF-...
     (kd1p1+kd1p2*APCP_Cdc20/(KCyclinB11+CyclinB1)+kd1p3*(APC_Cdh1 +APCP_Cdh1)/(KCyclinB12+CyclinB1))*CyclinB1;
dCDK1=-kf1*CyclinB1*CDK1+kr1*MPF+...
     (kd3p1+kd3p2*APCP_Cdc20/(KMPF1+MPF)+kd3p3*(APC_Cdh1 +APCP_Cdh1)/(KMPF2+MPF))*MPF+...    
     (kd4p1+kd4p2*APCP_Cdc20/(KpreMPF1+preMPF)+kd4p3*(APC_Cdh1 +APCP_Cdh1)/(KpreMPF2+preMPF))*preMPF; 
dMPF=kf1*CyclinB1*CDK1-kr1*MPF+kf2*preMPF-kr2*MPF+kf5*p21_MPF-...
     (kd3p1+kd3p2*APCP_Cdc20/(KMPF1+MPF)+kd3p3*(APC_Cdh1 +APCP_Cdh1)/(KMPF2+MPF)+kr5*p21^N1)*MPF+...
     kd6*APCP_Cdc20/(Kp21MPF+p21_MPF)*p21_MPF;
dpreMPF=kr2*MPF-kf2*preMPF-(kd4p1+kd4p2*APCP_Cdc20/(KpreMPF1+preMPF)+kd4p3*(APC_Cdh1 +APCP_Cdh1)/(KpreMPF2+preMPF))*preMPF;
dp21=ks5*(1+p53/Kp53)+kf5*N1*p21_MPF-kr5*N1*MPF*p21^N1-kd5*p21;

dp21_MPF=kr5*MPF*p21^N1-kf5*p21_MPF-kd6*APCP_Cdc20/(Kp21MPF+p21_MPF)*p21_MPF;
dCdc25P=kf3*Cdc25-kr3*Cdc25P/(KCdc25P1+Cdc25P)-kd7p1*Cdc25P-kd7p3*Cdc25P*((APC_Cdh1+APCP_Cdh1)/(KCdc25P2+Cdc25P));
dCdc25=ks8*KA2/(KA2+ATM_ATR)-kf3*Cdc25+kr3*Cdc25P/(KCdc25P1+Cdc25P)-kd8p1*Cdc25-kd8p3*Cdc25*((APC_Cdh1+APCP_Cdh1)/(KCdc25+Cdc25));
dWee1=ks9+kr4*Wee1P/(KWee1P+Wee1P)-kf4*Wee1-kd9*Wee1;
dWee1P=kf4*Wee1-kr4*Wee1P/(KWee1P+Wee1P)-kd10*Wee1P;
dPlk1P=kf6*Plk1-kr6*Plk1P/(KPlk1P1+Plk1P)-kd11p1*Plk1P-kd11p3*(APC_Cdh1+APCP_Cdh1)/(KPlk1P2+Plk1P)*Plk1P-kf17*p53P*Plk1P+kr17*p53P_Plk1P;
dPlk1=ks12+kr6*Plk1P/(KPlk1P1+Plk1P)-kf6*Plk1-kd12p1*Plk1-kd12p3*((APC_Cdh1+APCP_Cdh1)/(KPlk1+Plk1))*Plk1;
dPPase= ks13+kf7*PPaseP-kr7*PPase-kd13*PPase;
dPPaseP=kr7*PPase-kf7*PPaseP-kd14*PPaseP;
dAPC=ks15-kf8*APC+kr8*APCP/(KAPCP+APCP)+kr8*APCP_Cdc20+(kr11+kr12)*APC_Cdh1-kf12*APC*Cdh1-kd15*APC;
dAPCP=kf8*APC-kr8*APCP/(KAPCP+APCP)-kf10*APCP*Cdc20-kf13*APCP*Cdh1 +...
     (kr9+kr10)*APCP_Cdc20+(kr11+kr13)*APCP_Cdh1-kd16*APCP;
dCdc20=ks17+kf9*Cdc20P/(KCdc20P1+Cdc20P)-kr9*Cdc20+...
    (kr10+kr8)*APCP_Cdc20-kf10*Cdc20*APCP-kd17p1*Cdc20-kd17p3*(APC_Cdh1+APCP_Cdh1)/(KCdc20+Cdc20)*Cdc20;
dCdc20P=kr9*Cdc20-kf18*Mad2*Cdc20P+kr18p*Mad2_Cdc20P*(1+p21/KMCD+ Epsilon*Plk1P/KMCD)-kf9*Cdc20P/(KCdc20P1+Cdc20P)+kr9*APCP_Cdc20-kd18p1*Cdc20P-kd18p3*(APC_Cdh1+APCP_Cdh1)/(KCdc20P2+Cdc20P)*Cdc20P;
if Mad2_Cdc20P > ASP   
    dCdc20=0;
    dCdc20P=0;
end
dAPCP_Cdc20=kf10*APCP*Cdc20-(kr8+kr9+kr10)*APCP_Cdc20;
dCdh1=ks20-kr11*Cdh1+kf11*Cdh1P/(KCdh1P+Cdh1P)+kr12*APC_Cdh1+kr13*APCP_Cdh1-kf12*Cdh1*APC- kf13*Cdh1*APCP-kd20*Cdh1;
dCdh1P=kr11*Cdh1-kf11*Cdh1P/(KCdh1P+Cdh1P)+kr11*APC_Cdh1 + kr11*APCP_Cdh1-kd21*Cdh1P;
dAPC_Cdh1=kf12*APC*Cdh1+kr8*APCP_Cdh1-(kf8+kr11+kr12)*APC_Cdh1;
dAPCP_Cdh1=kf13*APCP*Cdh1+ kf8*APC_Cdh1-(kr8+kr11+kr13)*APCP_Cdh1;
dPttg1=ks24+kf14*Pttg1P/(KPttg1P1+Pttg1P)-kr14*Pttg1-kd24p2*APCP_Cdc20/(KPttg1+Pttg1)*Pttg1-kd24p1*Pttg1;
dPttg1P=kr14*Pttg1-kf14*Pttg1P/(KPttg1P1+Pttg1P)-kd25p2*APCP_Cdc20/(KPttg1P2+Pttg1P)*Pttg1P-kd25p1*Pttg1P;
dLMNAP=kf15*LMNA-kr15*LMNAP;
dATM_ATR=ks27*(1+KDDS*sig) -kd27p*ATM_ATR*Wip1^N2/(KWip1^N2+Wip1^N2)- kd27*ATM_ATR;
dp53= ks28*(1 + ATM_ATR/KA3)-kf16*p53+ kr16*p53P-kd28p*p53*Mdm2-kd28*p53;  
dp53P= kf16*p53+kr17*p53P_Plk1P-kf17*p53P*Plk1P-kd29p*p53P*Mdm2 - kr16*p53P -kd29*p53P;
dp53P_Plk1P=kf17*p53P*Plk1P-kr17*p53P_Plk1P;
%----------------------------
dMdm2= ks31+ ks31p*p53P -kd31p1*ATM_ATR*Mdm2-kd31*Mdm2;
%----------------------------
dWip1= ks32+ks32p*p53P-kd32*Wip1;
dMad2=ks33-kf18*Mad2*Cdc20P+kr18p*Mad2_Cdc20P*(1+p21/KMCD+ Epsilon*Plk1P/KMCD)-kd33*Mad2;
dMad2_Cdc20P= kf18*Mad2*Cdc20P-kr18p*Mad2_Cdc20P*(1+p21/KMCD+ Epsilon*Plk1P/KMCD);

dY(1)=dCyclinB1;
dY(2)=dCDK1;
dY(3)=dMPF;
dY(4)=dpreMPF;
dY(5)=dp21;
dY(6)=dp21_MPF;
dY(7)=dCdc25P;
dY(8)=dCdc25;
dY(9)=dWee1;
dY(10)=dWee1P;
dY(11)=dPlk1P;
dY(12)=dPlk1;
dY(13)=dPPase;
dY(14)=dPPaseP;
dY(15)=dAPC;
dY(16)=dAPCP;
dY(17)=dCdc20;
dY(18)=dCdc20P;
dY(19)=dAPCP_Cdc20;
dY(20)=dCdh1;
dY(21)=dCdh1P;
dY(22)=dAPC_Cdh1;
dY(23)=dAPCP_Cdh1;
dY(24)=dPttg1;
dY(25)=dPttg1P;
dY(26)=dLMNAP;
dY(27)=dATM_ATR;
dY(28)=dp53;
dY(29)=dp53P;
dY(30)=dp53P_Plk1P;
dY(31)=dMdm2;
dY(32)=dWip1;
dY(33)=dMad2;
dY(34)=dMad2_Cdc20P;

dY=1.65*dY';


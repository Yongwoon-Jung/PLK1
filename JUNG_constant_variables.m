%-------------------------------------------------------------------------- 
% Plk1-p53 Model 
% File name: JUNG_constant_variables
% Author: Yongwoon Jung
% Last updated: 6/17/2020
%-------------------------------------------------------------------------- 

%-------------------------------------------------------------------------- 
% These are the variables for proteins and parameters.
%-------------------------------------------------------------------------- 
concentration_str={'CyclinB','CDK1','MPF (CyclinB:CDK1)','preMPF','p21',...
    'p21:MPF','Cdc25P','Cdc25','Wee1','Wee1P','Plk1P','Plk1','PP2A',...
    'PP2AP','APC/C','APC/CP','Cdc20','Cdc20P','APC/CP:Cdc20','Cdh1'...
    'Cdh1P','APC/C:Cdh1','APC/CP:Cdh1','Pttg1','Pttg1P','LMNAP','ATM/ATR',...
    'p53','p53:Plk1P','Mad2','Mad2:Cdc20P','CyclinBT','CDK1T','APC/CT:Cdh1',...
    'APC/CPT','Wee1T','Cdc25T','Cdc20T','Cdh1T','APC/CT'...
    'p21T','Plk1T','Pttg1T','PP2AT','LMNAT','Mad2T'};

parameter_str={'k_{f1}','k_{r1}','k''_{f2}','k''''_{f2}','k''_{r2}',...
    'k''''_{r2}','k''_{f3}','k''''_{f3}','k''_{r3}',...
    'k''_{f4}','k''''_{f4}','k''_{r4}','k_{f5}','k_{r5}',...
    'k''_{f6}','k''_{r6}','k_{f7}','k''_{r7}','k''_{f8}','k''''_{f8}',...
    'k''_{r8}','k''_{r9}','k''''_{r9}', 'k''_{f9}','k_{f10}','k_{r10}',...
    'k''_{f11}','k''_{r11}','k''''_{r11}','k_{f12}','k_{r12}','k_{f13}',...
    'k_{r13}','k''_{f14}','k''_{r14}','k''_{f15}', 'k_{r15}','k_{f16}',...
    'k_{r16}','k_{f17}','k_{r17}','k_{s1}','k_{s5}','k_{s8}','k_{s9}',...
    'k_{s12}','k_{s13}','k_{s15}','k_{s17}','k_{s20}','k_{s24}',...
    'k_{s27}','k_{s28}','k_{s30}', 'k_{d1.1}','k_{d1.2}','k_{d1.3}',...
    'k_{d3.1}','k_{d3.2}','k_{d3.3}','k_{d4.1}',...
    'k_{d4.2}','k_{d4.3}','k_{d5}','k_{d6}','k_{d7.1}','k_{d7.3}',...
    'k_{d8.1}','k_{d8.3}','k_{d9}','k_{d10}','k_{d11.1}',...
    'k_{d11.3}','k_{d12.1}','k_{d12.3}','k_{d13}','k_{d14}','k_{d15}',...
    'k_{d16}','k_{d17.1}','k_{d17.3}','k_{d18.1}','k_{d18.3}','k_{d20}',...
    'k_{d21}','k_{d24.1}','k_{d24.2}','k_{d25.1}','k_{d25.2}','k_{d27}',...
    'k_{d28}','k_{d30}','K_{A1}','K_{P}','K_{A2}','K_{p53}','K_{DDS}',...
    'k_{A3}','k_{MCD}','k_{Epsilon}','K_{CyclinB1}','K_{CyclinB2}',...
    'K_{MPF1}','K_{MPF2}','K_{preMPF1}','K_{preMPF2}','K_{p21MPF}',...
    'K_{Cdc25P1}','K_{Cdc25P2}','K_{Cdc25}','K_{Wee1P}','K_{Plk1P1}',...
    'K_{Plk1P2}','K_{Plk1}','K_{APCP}','K_{Cdc20P1}','K_{Cdc20}',...
    'K_{Cdc20P2}','K_{Cdh1P}','K_{Pttg1P1}','K_{Pttg1}','K_{Pttg1P2}'};

%-------------------------------------------------------------------------- 
% These are the colors and styles used in the graph.
%-------------------------------------------------------------------------- 
colors={[255/255 0/255 128/255],... % CCNB
     [0/255 0/255 255/255],...      % Cdk1
     [0/255 0/255 0/255],...        % MPF
     [0/255 0/255 0/255],...        % preMPF
     [0/255 128/255 0/255],...      % p21
     [0/255 128/255 0/255],...      % p21:MPF 
     [255/255 0/255 0/255],...      % Cdc25P
     [255/255 0/255 0/255],...      % Cdc25 
     [0/255 255/255 0/255],...      % Wee1 
     [0/255 255/255 0/255],...      % Wee1P
     [128/255 0/255 128/255],...    % Plk1P
     [128/255 0/255 128/255],...    % Plk1
     [0/255 100/255 200/255],...    % PP2A
     [0/255 100/255 200/255],...    % PP2AP
     [128/255 128/255 0/255],...    % APC
     [128/255 128/255 0/255],...    % APCP
     [0/255 255/255 255/255],...    % Cdc20 
     [0/255 255/255 255/255],...    % Cdc20P
     [0/255 255/255 255/255],...    % APCP:Cdc20
     [255/255 0/255 255/255],...    % Cdh1
     [255/255 0/255 255/255],...    % Cdh1P
     [255/255 0/255 255/255],...    % APC:Cdh1
     [255/255 100/255 255/255],...  % APCP:Cdh1
     [0/255 128/255 128/255],...    % PTTG1
     [0/255 128/255 128/255],...    % PTTG1P
     [255/255 127/255 0/255],...    % LMNAP
     [150/255 200/255 150/255],...  % ATM_ATR
     [160/255 20/255 20/255],...    % p53
     [160/255 20/255 20/255],...    % p53_Plk1 
     [90/255 90/255 90/255],...     % Mad2
     [255/255 0/255 0/255],...      % Mad2_Cdc20P  
     [255/255 0/255 128/255],...    % CyclinBT    
     [0/255 0/255 255/255],...      % CDK1T
     [255/255 255/255 0/255],...    % APC:Cdh1T
     [50/255 150/255 255/255],...   % Active
     [0/255 255/255 0/255],...      % Wee1T
     [255/255 0/255 0/255],...      % Cdc25T
     [0/255 255/255 255/255],...    % Cdc20T
     [255/255 0/255 255/255],...    % Cdh1T
     [128/255 128/255 0/255],...    % APCT
     [0/255 128/255 0/255],...      % P21T
     [128/255 0/255 128/255],...    % Plk1T
     [0/255 128/255 128/255]...     % PTTG1T
     [0/255 100/255 200/255],...    % PP2AT
     [255/255 127/255 0/255],...    % LMNAT   
     [90/255 90/255 90/255],...     % Mad2T  
};
styles={':',...     % CyclinB (Dotted line)
        ':',...     % CDK1 (Dotted line)
        '-',...     % MPF (Solid Line)
        '--',...    % preMPF (Dashed line)
        '--',...    % p21  (Dashed line)
        '-.',...    % p21:MPF (Dash-dot line)
        '--',...    % Cdc25P (Dashed line)
        ':',...     % Cdc25 (Dotted line)
        ':',...     % Wee1 (Dotted line)
        '--',...    % Wee1P (Dashed line)
        '--',...    % Plk1P (Dashed line)
        ':',...     % Plk1 (Dotted line)
        ':',...     % PP2A (Dotted line)
        '--',...    % PP2AP (Dashed line)
        ':',...     % APC/C (Dotted line)
        '--',...    % APC/CP (Dashed line)
        ':',...     % Cdc20 (Dotted line)
        '--',...    % Cdc20P (Dashed line)
        '-.',...    % APC/CP:Cdc20 (Dash-dot line)
        ':',...     % Cdh1 (Dotted line)
        '--',...    % Cdh1P (Dashed line)
        '-.',...    % APC/C:Cdh1 (Dash-dot line)
        '-.',...    % APC/CP:Cdh1 (Dash-dot line)
        ':',...     % PTTG1 (Dotted line)
        '--',...    % PTTG1P (Dashed line)  
        '--',...    % LMNAP (Dashed line)
        '-',...     % ATM_ATR (Solid Line)
        '-',...     % p53(Solid Line)  
        '-.',...    % p53_Plk1P(Dash-dot line)  
        ':',...     % Mad2(Dotted Line)   
        '-',...    % Mad2:Cdc20P(Solid line) 
        '-',...     % CyclinBT (Solid Line)
        '-',...     % CDK1T (Solid Line)
        '-',...     % APC/C:Cdh1T (Solid line) 
        '-',...     % APC/CPT (Solid line) 
        '-',...     % Wee1T (Solid Line)
        '-',...     % Cdc25T (Solid Line) 
        '-',...     % Cdc20T (Solid Line)
        '-'...      % Cdh1T (Solid Line)
        '-',...     % APC/CT (Solid Line)
        '-',...     % P21T (Solid Line)
        '-',...     % Plk1T (Solid Line)
        '-',...     % PTTG1T (Solid Line)
        '-',...     % PP2AT (Solid Line)
        '-',...     % LMNAT (Solid Line) 
        '-',...     % MAD2T (Solid Line)
};

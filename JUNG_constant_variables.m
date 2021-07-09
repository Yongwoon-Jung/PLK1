%-------------------------------------------------------------------------- 
%
%-------------------------------------------------------------------------- 
concentration_str={'CyclinB','CDK1','MPF (CyclinB:CDK1)','preMPF','p21',...
    'p21:MPF','Cdc25P','Cdc25','Wee1','Wee1P','Plk1P','Plk1','PP2A',...
    'PP2AP','APC/C','APC/CP','Cdc20','Cdc20P','APC/CP:Cdc20','Cdh1'...
    'Cdh1P','APC/C:Cdh1','APC/CP:Cdh1','Pttg1','Pttg1P','LMNAP','ATM/ATR',...
    'p53', 'p53P','p53P:Plk1P','Mdm2','Wip1','Mad2','Mad2:Cdc20P','CyclinBT','CDK1T','APC/CT:Cdh1',...
    'APC/CPT','Wee1T','Cdc25T','Cdc20T','Cdh1T','APC/CT','p53T',...
    'p21T','Plk1T','Pttg1T','PP2AT','LMNAT','Mad2T'};

parameter_str={'k_{f1}','k_{r1}','k''_{f2}','k''''_{f2}','k''_{r2}',...
    'k''''_{r2}','k''_{f3}','k''''_{f3}','k''_{r3}',...
    'k''_{f4}','k''''_{f4}','k''_{r4}','k_{f5}','k_{r5}',...
    'k''_{f6}','k''_{r6}','k_{f7}','k''_{r7}','k''_{f8}','k''''_{f8}',...
    'k''_{r8}','k''_{r9}','k''''_{r9}', 'k''_{f9}','k_{f10}','k_{r10}',...
    'k''_{f11}','k''_{r11}','k''''_{r11}','k_{f12}','k_{r12}','k_{f13}',...
    'k_{r13}','k''_{f14}','k''_{r14}','k''_{f15}', 'k_{r15}','k''_{f16}',...
    'k''_{r16}','k_{f17}','k_{r17}','k_{f18}','k_{r18}','k_{s1}','k_{s5}','k_{s8}','k_{s9}',...
    'k_{s12}','k_{s13}','k_{s15}','k_{s17}','k_{s20}','k_{s24}',...
    'k_{s27}','k_{s28}','k_{s31}', 'k''_{s31}', 'k_{s32}','k''_{s32}','k_{s33}'...
    ,'k_{d1.1}','k_{d1.2}','k_{d1.3}','k_{d3.1}','k_{d3.2}','k_{d3.3}','k_{d4.1}',...
    'k_{d4.2}','k_{d4.3}','k_{d5}','k_{d6}','k_{d7.1}','k_{d7.3}',...
    'k_{d8.1}','k_{d8.3}','k_{d9}','k_{d10}','k_{d11.1}',...
    'k_{d11.3}','k_{d12.1}','k_{d12.3}','k_{d13}','k_{d14}','k_{d15}',...
    'k_{d16}','k_{d17.1}','k_{d17.3}','k_{d18.1}','k_{d18.3}','k_{d20}',...
    'k_{d21}','k_{d24.1}','k_{d24.2}','k_{d25.1}','k_{d25.2}','k_{d27}','k_{d27p}',...
    'k_{d28}','k_{d28p}','k_{d29}','k_{d29p}','k_{i31}','k_{d31}','k_{d32}','k_{d33}',...
    'K_{A1}','K_{Pttg11}','K_{A2}','K_{p53}','K_{DDS}',...
    'k_{A3}','k_{MCD}','k_{Epsilon}','K_{CyclinB1}','K_{CyclinB2}',...
    'K_{MPF1}','K_{MPF2}','K_{preMPF1}','K_{preMPF2}','K_{p21MPF}',...
    'K_{Cdc25P1}','K_{Cdc25P2}','K_{Cdc25}','K_{Wee1P}','K_{Plk1P1}',...
    'K_{Plk1P2}','K_{Plk1}','K_{APC/CP}','K_{Cdc20P1}','K_{Cdc20}',...
    'K_{Cdc20P2}','K_{Cdh1P}','K_{Pttg1P1}','K_{Pttg1}','K_{Pttg1P2}','K_{ATMATR}','K_{Wip1}'};

colors={[255/255 0/255 128/255],... % CCNB (Pink)
     [0/255 0/255 255/255],...      % Cdk1 (Blue)
     [0/255 0/255 0/255],...        % MPF  (Black)
     [0/255 0/255 0/255],...        % preMPF (Black)
     [0/255 128/255 0/255],...      % p21 (Olive)
     [0/255 128/255 0/255],...      % p21:MPF (Olive)  
     [255/255 0/255 0/255],...      % Cdc25P(Red)
     [255/255 0/255 0/255],...      % Cdc25 (Red)
     [0/255 255/255 0/255],...      % Wee1 (Lime)
     [0/255 255/255 0/255],...      % Wee1P(Lime)
     [128/255 0/255 128/255],...    % Plk1P(Purple)
     [128/255 0/255 128/255],...    % Plk1(Purple)
     [0/255 100/255 200/255],...    % PP2A()
     [0/255 100/255 200/255],...    % PP2AP()
     [128/255 128/255 0/255],...    % APC(Marron)
     [128/255 128/255 0/255],...    % APCP(Marron)
     [0/255 255/255 255/255],...    % Cdc20 (Cyan)
     [0/255 255/255 255/255],...    % Cdc20P(Cyan)
     [0/255 255/255 255/255],...    % APCP:Cdc20(Cyan)
     [255/255 0/255 255/255],...    % Cdh1 (Magenta)
     [255/255 0/255 255/255],...    % Cdh1P(Magenta)
     [255/255 0/255 255/255],...    % APC:Cdh1(Magenta)
     [255/255 100/255 255/255],...  % APCP:Cdh1(Magenta)
     [0/255 128/255 128/255],...    % PTTG1(Teal)
     [0/255 128/255 128/255],...    % PTTG1P(Teal)
     [255/255 127/255 0/255],...    % LMNAP(Orange)
     [150/255 200/255 150/255],...  % ATM_ATR()
     [160/255 20/255 20/255],...    % p53()
     [160/255 20/255 20/255],...    % p53P()   
     [160/255 20/255 20/255],...    % p53P_Plk1()  
     [0/255 0/255 255/255],...      % Mdm2() blue
     [255/255 0/255 0/255],...      % Wip1() 
     [90/255 90/255 90/255],...     % Mad2()
     [255/255 0/255 0/255],...      % Mad2_Cdc20P(red)  
     [255/255 0/255 128/255],...    % CyclinBT(Pink)     
     [0/255 0/255 255/255],...      % CDK1T(Blue)
     [255/255 255/255 0/255],...    % APC:Cdh1T(Yellow)
     [50/255 150/255 255/255],...   % Active APCT()
     [0/255 255/255 0/255],...      % Wee1T (Lime)
     [255/255 0/255 0/255],...      % Cdc25T (Red)
     [0/255 255/255 255/255],...    % Cdc20T (Cyan)
     [255/255 0/255 255/255],...    % Cdh1T (Magenta)
     [128/255 128/255 0/255],...    % APCT (Marron)
     [0/255 128/255 0/255],...      % P53T () 
     [0/255 128/255 0/255],...      % P21T (Marron)
     [128/255 0/255 128/255],...    % Plk1T (Purple)
     [0/255 128/255 128/255]...     % PTTG1T (Teal)
     [0/255 100/255 200/255],...    % PP2AT()
     [255/255 127/255 0/255],...    % LMNAT(Orange)   
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
        '--',...    % p53P(Dashed line)  
        '-.',...    % p53P_Plk1P(Dash-dot line)  
        ':',...     % Mdm2(Dotted Line)   
        ':',...     % Wip1(Dotted line) 
        ':',...     % Mad2(Dotted Line)   
        '-',...     % Mad2:Cdc20P(Solid line) 
        '-',...     % CyclinBT (Solid Line)
        '-',...     % CDK1T (Solid Line)
        '-',...     % APC/C:Cdh1T (Solid line) 
        '-',...     % APC/CPT (Solid line) 
        '-',...     % Wee1T (Solid Line)
        '-',...     % Cdc25T (Solid Line) 
        '-',...     % Cdc20T (Solid Line)
        '-'...      % Cdh1T (Solid Line)
        '-',...     % APC/CT (Solid Line)
        '-',...     % p53T (Solid Line)
        '-',...     % p21T (Solid Line)
        '-',...     % Plk1T (Solid Line)
        '-',...     % PTTG1T (Solid Line)
        '-',...     % PP2AT (Solid Line)
        '-',...     % LMNAT (Solid Line) 
        '-',...     % MAD2T (Solid Line)
};

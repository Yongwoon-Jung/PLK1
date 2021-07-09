%---------------------------------------------------------------------------------------
% Code Builder: Yongwoon Jung
% Fully hybrid model for mitotic cell cycle regulation.
% Last modified: 4/5/2021
% function : Jung_eqn.m, JUNG_init_parameters, JUNG_constant_variables
% main program : JUNG_Fig2_main.m
% Fig2
% 34 initial values, 137 parametes
%---------------------------------------------------------------------------------------

clear;
clc;
close all;

disp('processing...');

global P0
JUNG_constant_variables

% plot  
line_width=2;

% Simulation
options = odeset('RelTol', 1e-12, 'AbsTol', 1e-12, 'MaxStep', 1);
CellCycleModel = @(t,y)(JUNG_eqn(t,y));

figure(1);
set(figure(1),'Units','inches','Position',[0.5 0.5 10 8.5])
% Subplots at Custom Positions
% Specify pos as a four-element vector of the form [left bottom width height]
fpos=[0.08 0.6 0.67 0.35;
      0.08 0.1 0.4 0.35;
      0.55 0.1 0.4 0.35];  
%-------------------------------------------------------------------
% A
%-------------------------------------------------------------------
JUNG_init_parameters
tlast=96;
tspan=0:1:tlast;
[time,Y1] = ode15s(CellCycleModel,[nulltime 0],Y,options) ;
NY=Y1(end,:);
[time,Y1] = ode15s(CellCycleModel,tspan,NY,options) ;

 % calculate CyclinBT, MPFT, Active_APC
Y1(:,35)=Y1(:,1)+Y1(:,3)+Y1(:,4)+Y1(:,6); %CCNBT=CCNB + MPF + preMPF
Y1(:,36)=Y1(:,2)+Y1(:,3)+Y1(:,4)+Y1(:,6);                    %Cdk1T
Y1(:,37)=Y1(:,22)+Y1(:,23);       %APC:Cdh1T
Y1(:,38)=Y1(:,19)+Y1(:,22)+Y1(:,23);  %Active APCT
Y1(:,39)=Y1(:,9)+Y1(:,10);        %Wee1T
Y1(:,40)=Y1(:,7)+Y1(:,8);         %Cdc25T
Y1(:,41)=Y1(:,17)+Y1(:,18)+Y1(:,19)+Y1(:,31); %Cdc20T   
Y1(:,42)=Y1(:,20)+Y1(:,21)+Y1(:,22)+Y1(:,23);  %Cdh1T
Y1(:,43)=Y1(:,15)+Y1(:,16)+Y1(:,19)+Y1(:,22)+Y1(:,23);  %APCT
Y1(:,44)=Y1(:,28)+Y1(:,29)+Y1(:,30);         %p53T
Y1(:,45)=Y1(:,5)+Y1(:,6);         %p21T
Y1(:,46)=Y1(:,11)+Y1(:,12)+Y1(:,30);         %Plk1T
Y1(:,47)=Y1(:,24)+Y1(:,25);       %PTTG1T
Y1(:,48)=Y1(:,13)+Y1(:,14);       %PP2AT
Y1(:,49)=1;                       %LMNAT
Y1(:,50)=Y1(:,33)+Y1(:,34);       %MAD2T

subplot('Position',fpos(1,:));
hold on;
nos=[3 5 7 19 28 34 37 39 41 42 46 27 31 32];
pno=0;
for i=nos
    pno=pno+1;
    pline(pno)=plot(time,Y1(:,i),'color',colors{i},'Linestyle',styles{i},...
          'linewidth',line_width);
    legend_str{pno}=concentration_str{i};
end
  
%MPF
plot(time,Y1(:,3),'color',colors{3},'Linestyle',styles{3},...
      'linewidth',3) 

set(gca,'Fontsize',12,'FontWeight','bold');
set(gca,'box','on','Xtick',0:12:tlast)
xlabel('Time (hr)');
ylabel('Relative concentrations');
xlim([0 tlast]);
ylim([0 1]);

annotation('textbox',[.08 .89 .1 .1],'String','A',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
    
%-------------------------------------------------------------
% B
% ks12=0.1, P0(48)
%-------------------------------------------------------------
JUNG_init_parameters
P0(48)=0.03;

tlast=192;
tspan=0:0.1:tlast;
[time,Y1] = ode15s(CellCycleModel,[nulltime 0],Y,options) ;
NY=Y1(end,:);
[time,Y1] = ode15s(CellCycleModel,tspan,NY,options) ;

% calculate CyclinBT, MPFT, Active_APC
Y1(:,35)=Y1(:,1)+Y1(:,3)+Y1(:,4)+Y1(:,6); %CCNBT=CCNB + MPF + preMPF
Y1(:,36)=Y1(:,2)+Y1(:,3)+Y1(:,4)+Y1(:,6);                    %Cdk1T
Y1(:,37)=Y1(:,22)+Y1(:,23);       %APC:Cdh1T
Y1(:,38)=Y1(:,19)+Y1(:,22)+Y1(:,23);  %Active APCT
Y1(:,39)=Y1(:,9)+Y1(:,10);        %Wee1T
Y1(:,40)=Y1(:,7)+Y1(:,8);         %Cdc25T
Y1(:,41)=Y1(:,17)+Y1(:,18)+Y1(:,19)+Y1(:,31); %Cdc20T   
Y1(:,42)=Y1(:,20)+Y1(:,21)+Y1(:,22)+Y1(:,23);  %Cdh1T
Y1(:,43)=Y1(:,15)+Y1(:,16)+Y1(:,19)+Y1(:,22)+Y1(:,23);  %APCT
Y1(:,44)=Y1(:,28)+Y1(:,29);         %p53T
Y1(:,45)=Y1(:,5)+Y1(:,6);         %p21T
Y1(:,46)=Y1(:,11)+Y1(:,12)+Y1(:,29);         %Plk1T
Y1(:,47)=Y1(:,24)+Y1(:,25);       %PTTG1T
Y1(:,48)=Y1(:,13)+Y1(:,14);       %PP2AT
Y1(:,49)=1;                       %LMNAT
Y1(:,50)=Y1(:,33)+Y1(:,34);       %MAD2T

subplot('Position',fpos(2,:));
hold on;
pno=0;
nos=[3 5 27 28 31 32 34 19];

for i=nos
    pno=pno+1;
    pline2(pno)=plot(time,Y1(:,i),'color',colors{i},'Linestyle',styles{i},...
          'linewidth',line_width);  
    legend2_str{pno}=concentration_str{i};
end
%MPF
plot(time,Y1(:,3),'color',colors{3},'Linestyle',styles{3},'linewidth',3)
       
set(gca,'Fontsize',12,'FontWeight','bold');
set(gca,'box','on','Xtick',0:6:tlast)
xlabel('Time (hr)');
ylabel('Relative concentrations');
%xlim([60 72]);
xlim([42 54]);
ylim([0 2]);

annotation('textbox',[.08 .39 .1 .1],'String','B',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')

%-------------------------------------------------------------
% C
% ks12 Plk1 synthesis rate constant P0(48)=0.1
% dATM_ATR=ks27*(KDDS+sig)- kd27*ATM_ATR;
%-------------------------------------------------------------
JUNG_init_parameters
P0(48)=0.03;
P0(97)=0;

tlast=192;
tspan=0:0.1:tlast;
[time,Y1] = ode15s(CellCycleModel,[nulltime 0],Y,options) ;
NY=Y1(end,:);
[time,Y1] = ode15s(CellCycleModel,tspan,NY,options) ;

 % calculate CyclinBT, MPFT, Active_APC
Y1(:,35)=Y1(:,1)+Y1(:,3)+Y1(:,4)+Y1(:,6); %CCNBT=CCNB + MPF + preMPF
Y1(:,36)=Y1(:,2)+Y1(:,3)+Y1(:,4)+Y1(:,6);                    %Cdk1T
Y1(:,37)=Y1(:,22)+Y1(:,23);       %APC:Cdh1T
Y1(:,38)=Y1(:,19)+Y1(:,22)+Y1(:,23);  %Active APCT
Y1(:,39)=Y1(:,9)+Y1(:,10);        %Wee1T
Y1(:,40)=Y1(:,7)+Y1(:,8);         %Cdc25T
Y1(:,41)=Y1(:,17)+Y1(:,18)+Y1(:,19)+Y1(:,31); %Cdc20T   
Y1(:,42)=Y1(:,20)+Y1(:,21)+Y1(:,22)+Y1(:,23);  %Cdh1T
Y1(:,43)=Y1(:,15)+Y1(:,16)+Y1(:,19)+Y1(:,22)+Y1(:,23);  %APCT
Y1(:,44)=Y1(:,28)+Y1(:,29)+Y1(:,30);         %p53T
Y1(:,45)=Y1(:,5)+Y1(:,6);         %p21T
Y1(:,46)=Y1(:,11)+Y1(:,12)+Y1(:,30);         %Plk1T
Y1(:,47)=Y1(:,24)+Y1(:,25);       %PTTG1T
Y1(:,48)=Y1(:,13)+Y1(:,14);       %PP2AT
Y1(:,49)=1;                       %LMNAT
Y1(:,50)=Y1(:,33)+Y1(:,34);       %MAD2T

subplot('Position',fpos(3,:));
hold on;
pno=0;
%nos=[3 7 9 19 32 34 35 36 37 38 39 41 42 43 44];
nos=[3 5 27 28 31 32 34 19];
for i=nos
    pno=pno+1;
    pline2(pno)=plot(time,Y1(:,i),'color',colors{i},'Linestyle',styles{i},...
          'linewidth',line_width);  
    legend2_str{pno}=concentration_str{i};
end
%MPF
plot(time,Y1(:,3),'color',colors{3},'Linestyle',styles{3},'linewidth',3)
       
set(gca,'Fontsize',12,'FontWeight','bold');
set(gca,'box','on','Xtick',0:6:tlast)
xlabel('Time (hr)');
ylabel('Relative concentrations');
%xlim([84 102]);
xlim([60 78]);
ylim([0 10]);

annotation('textbox',[.55 .39 .1 .1],'String','C',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
    
%-------------------------------------------------------------
% display legend
% 10 legends
hL = legend(pline,legend_str,'Fontsize',11);
set(hL,'Box','off')
% Programatically move the Legend
set(hL,'Position', [0.78 0.655 0.2 0.2],'Units', 'normalized');

%-------------------------------------------------------------
% make graph file
gfilename='FIG2.tif';
print(gfilename,'-dtiff', '-r300');  % 300 dpi is better
disp([gfilename ' is created']);


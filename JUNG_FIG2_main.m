%-------------------------------------------------------------------------- 
% Plk1-p53 Model 
% File name: JUNG_FIG2_main
% Author: Yongwoon Jung
% Last updated: 6/17/2020
% function : Jung_eqn.m, JUNG_init_parameters, JUNG_constant_variables
% data file : Fig2A_2019Paper.fig
% 31 initial values, 122 parametes
%-------------------------------------------------------------------------- 

clear
clc
close all

disp('processing...');

% FIG 2A
filename='Fig2A.fig';
openfig(filename);

global P0
JUNG_constant_variables

% plot  
line_width=2;

% Simulation
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6, 'MaxStep', 1);
CellCycleModel = @(t,y)(JUNG_eqn(t,y));

figure(1);
set(figure(1),'Units','inches','Position',[0.5 0.5 11 8.5])
% Subplots at Custom Positions
% Specify pos as a four-element vector of the form [left bottom width height]
fpos=[0.1 0.6 0.37 0.35;
      0.57 0.6 0.37 0.35;
      0.1 0.1 0.37 0.35;
      0.57 0.1 0.37 0.35];
  
%-------------------------------------------------------------------
% FIG 2B
% tlast=96 sec
%-------------------------------------------------------------------
JUNG_init_parameters
tlast=96;
tspan=0:0.1:tlast;
[time,Y1] = ode15s(CellCycleModel,[nulltime 0],Y,options) ;
NY=Y1(end,:);
[time,Y1] = ode15s(CellCycleModel,tspan,NY,options) ;

% calculate CyclinBT, MPFT, Active_APC
Y1(:,32)=Y1(:,1)+Y1(:,3)+Y1(:,4)+Y1(:,6); %CCNBT=CCNB + MPF + preMPF
Y1(:,33)=Y1(:,2)+Y1(:,3)+Y1(:,4)+Y1(:,6); %Cdk1T
Y1(:,34)=Y1(:,22)+Y1(:,23);               %APC:Cdh1T
Y1(:,35)=Y1(:,19)+Y1(:,22)+Y1(:,23);      %Active APCT
Y1(:,36)=Y1(:,9)+Y1(:,10);                %Wee1T
Y1(:,37)=Y1(:,7)+Y1(:,8);                 %Cdc25T
Y1(:,38)=Y1(:,17)+Y1(:,18)+Y1(:,19)+Y1(:,31); %Cdc20T   
Y1(:,39)=Y1(:,20)+Y1(:,21)+Y1(:,22)+Y1(:,23);  %Cdh1T
Y1(:,40)=Y1(:,15)+Y1(:,16)+Y1(:,19)+Y1(:,22)+Y1(:,23);  %APCT
Y1(:,41)=Y1(:,5)+Y1(:,6);                 %p21T
Y1(:,42)=Y1(:,11)+Y1(:,12)+Y1(:,29);      %Plk1T
Y1(:,43)=Y1(:,24)+Y1(:,25);               %PTTG1T
Y1(:,44)=Y1(:,13)+Y1(:,14);               %PP2AT
Y1(:,45)=1;                               %LMNAT
Y1(:,46)=Y1(:,30)+Y1(:,31);               %MAD2T

subplot('Position',fpos(2,:));
hold on;
nos=[3 7 19 34 36 38 39 41 42 43];
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

annotation('textbox',[.57 .89 .1 .1],'String','B',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
    
%-------------------------------------------------------------
% FIG 2C
% ks12=0.05, P0(46)
% tlast=140 sec
%-------------------------------------------------------------
JUNG_init_parameters
P0(46)=0.03;
tlast=140;
tspan=0:0.1:tlast;
[time,Y1] = ode15s(CellCycleModel,[nulltime 0],Y,options) ;
NY=Y1(end,:);
[time,Y1] = ode15s(CellCycleModel,tspan,NY,options) ;

% calculate CyclinBT, MPFT, Active_APC
Y1(:,32)=Y1(:,1)+Y1(:,3)+Y1(:,4)+Y1(:,6); %CCNBT=CCNB + MPF + preMPF
Y1(:,33)=Y1(:,2)+Y1(:,3)+Y1(:,4)+Y1(:,6); %Cdk1T
Y1(:,34)=Y1(:,22)+Y1(:,23);               %APC:Cdh1T
Y1(:,35)=Y1(:,19)+Y1(:,22)+Y1(:,23);      %Active APCT
Y1(:,36)=Y1(:,9)+Y1(:,10);                %Wee1T
Y1(:,37)=Y1(:,7)+Y1(:,8);                 %Cdc25T
Y1(:,38)=Y1(:,17)+Y1(:,18)+Y1(:,19)+Y1(:,31); %Cdc20T   
Y1(:,39)=Y1(:,20)+Y1(:,21)+Y1(:,22)+Y1(:,23);  %Cdh1T
Y1(:,40)=Y1(:,15)+Y1(:,16)+Y1(:,19)+Y1(:,22)+Y1(:,23);  %APCT
Y1(:,41)=Y1(:,5)+Y1(:,6);                 %p21T
Y1(:,42)=Y1(:,11)+Y1(:,12)+Y1(:,29);      %Plk1T
Y1(:,43)=Y1(:,24)+Y1(:,25);               %PTTG1T
Y1(:,44)=Y1(:,13)+Y1(:,14);               %PP2AT
Y1(:,45)=1;                               %LMNAT
Y1(:,46)=Y1(:,30)+Y1(:,31);               %MAD2T

subplot('Position',fpos(3,:));
hold on;
pno=0;
nos=[5 6 27 28 29 30 31];
for i=nos
    pno=pno+1;
    pline2(pno)=plot(time,Y1(:,i),'color',colors{i},'Linestyle',styles{i},...
          'linewidth',line_width);  
    legend2_str{pno}=concentration_str{i};
end
%MPF
plot(time,Y1(:,3),'color',colors{3},'Linestyle',styles{3},'linewidth',3)
       
set(gca,'Fontsize',12,'FontWeight','bold');
set(gca,'box','on','Xtick',0:24:tlast)
xlabel('Time (hr)');
ylabel('Relative concentrations');
xlim([0 tlast]);
ylim([0 1]);

annotation('textbox',[.1 .39 .1 .1],'String','C',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')

%-------------------------------------------------------------
% display legend
% 10 legends
hL = legend(pline,legend_str,'Fontsize',11);
set(hL,'Box','off')
% Programatically move the Legend
set(hL,'Position', [0.63 0.22 0.2 0.2],'Units', 'normalized');

% 7 legends
hL = legend(pline2,legend2_str,'Fontsize',11);
set(hL,'Box','off')
% Programatically move the Legend
set(hL,'Position', [0.45 0.26 0.2 0.2],'Units', 'normalized');
%-------------------------------------------------------------
% make graph file
gfilename='FIG2.tif';
print(gfilename,'-dtiff', '-r300');  % 300 dpi is better
disp([gfilename ' is created']);

%---------------------------------------------------------------------------------------
% Fully hybrid model for mitotic cell cycle regulation.
% Last modified: 10/2/2020
% function : Jung_eqn.m, JUNG_init_parameters
% main program : JUNG_Fig_main.m
% 34 initial values, 137 parametes
%---------------------------------------------------------------------------------------
clear;
clc;
close all;

disp('processing...');

global P0

JUNG_init_parameters
JUNG_constant_variables

% Simulation
tlast=96;
tspan=0:0.1:tlast;
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10, 'MaxStep', 1);
CellCycleModel = @(t,y)(JUNG_eqn(t,y));

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


% plot  
line_width=2;

figure(1);
set(figure(1),'Units','inches','Position',[0.5 0.5 12 9.5])
hold on;

for i=1:50
    pline(i)=plot(time,Y1(:,i),'color',colors{i},'Linestyle',styles{i},...
          'linewidth',line_width);        
end
%MPF
plot(time,Y1(:,3),'color',colors{3},'Linestyle',styles{3},...
      'linewidth',3) 
set(gca,'Fontsize',14);
set(gca,'box','on','Xtick',0:12:tlast)
xlabel('Time (hr)');
ylabel('Relative concentrations');

%-------------------------------------------------------------
% display legend
hL = legend(pline,concentration_str,'Fontsize',8);
set(hL,'Box','off')
% Programatically move the Legen
set(hL,'Position', [0.83 0.03 0.2 0.9],'Units', 'normalized');
%-------------------------------------------------------------
ax1 = gca;
ax1.TickDir = 'out';
set(ax1, 'box', 'off', 'color', 'none')
ax1.Position(3)=0.7;
ax2= axes('Position',get(ax1,'Position'),'LineWidth', 1.5,'box','on','xtick',[],'ytick',[]);
axes(ax1)
linkaxes([ax1, ax2])
xlim([0 tlast]);
ylim([0 1]);
%-------------------------------------------------------------
% make graph file
gfilename='FIG_ALL.tif';
print(gfilename,'-dtiff', '-r300');  % 600 dpi is better
disp([gfilename ' is created']);


%-------------------------------------------------------------
figure(2);
set(figure(2),'Units','normalized','Position',[0 0 1 1])

nos=[1 5 8 9 12 13 15 17 20 24 27 28 31 32 33];
for i=1:length(nos)
    subplot(3,5,i);
    plot(time,Y1(:,nos(i)),'color',colors{nos(i)},'Linestyle',styles{nos(i)},...
      'linewidth',line_width)    
    title(concentration_str{nos(i)},'FontSize',8);
    legend_str{i}=concentration_str{nos(i)};
end
% make graph file
gfilename='FIG_sub.tif';
print(gfilename,'-dtiff', '-r300');  % 600 dpi is better
disp([gfilename ' is created']);

pcolor='b';
figure(3);
set(figure(3),'Units','normalized','Position',[0 0 1 1])
for i=1:50
    subplot(6,9,i);
    plot(time,Y1(:,i),'color',pcolor,'linewidth',line_width)        
    title(concentration_str{i},'Fontsize',10);
end

% make graph file
gfilename='FIG_sub2.tif';
print(gfilename,'-dtiff', '-r300');  % 600 dpi is better
disp([gfilename ' is created']);


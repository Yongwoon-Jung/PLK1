%-------------------------------------------------------------------------- 
% Plk1-p53 Model 
% File name: JUNG_FIG7_main
% Author: Yongwoon Jung
% Last updated: 6/17/2020
% function : Jung_eqn.m, JUNG_init_parameters, JUNG_constant_variables
% 1x2 graph% 31 initial values, 122 parametes
%-------------------------------------------------------------------------- 
clear;
clc;
close all;

global P0 

disp('processing...');

JUNG_init_parameters
JUNG_constant_variables

% Simulation
tlast=96;
tspan=0:1:tlast;
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6, 'MaxStep', 1);
CellCycleModel = @(t,y)(JUNG_eqn(t,y));

% plot  
line_width=2;

% draw graph - combine n separate graphs into one figure
figure(1); 
set(figure(1),'Units','inches','Position',[0.5 0.5 11 8.5])
% Subplots at Custom Positions
% Specify pos as a four-element vector of the form [left bottom width height]
fpos=[0.1 0.6 0.3 0.35;
      0.48 0.6 0.3 0.35;
      0.1 0.1 0.3 0.35;
      0.48 0.1 0.3 0.35];
  
% Cdk1T, CCNBT, Wee1, Wee1P, Wee1T, preMPF, MPF
nos=[3 7 9 19 31 34 42];
for i=1:length(nos)
    legend_str{i}=concentration_str{nos(i)}; 
end

ks8_val=[0.06 0.08 0.1 0.16];
kd8p1_val=[0.2 0.2 0.2 0.2];
for no=1:length(ks8_val)
    P0(44)=ks8_val(no);  %Cdc25 synthesis rate
    P0(68)=kd8p1_val(no);  %Cdc25 degradation rate
    [time,Y1] = ode15s(CellCycleModel,[nulltime 0],Y,options) ;
    NY=Y1(end,:);
    [time,Y1] = ode15s(CellCycleModel,[0 tlast],NY,options) ;

    % calculate CyclinBT, MPFT, Active_APC
    Y1(:,32)=Y1(:,1)+Y1(:,3)+Y1(:,4)+Y1(:,6); %CCNBT=CCNB + MPF + preMPF
    Y1(:,33)=Y1(:,2)+Y1(:,3)+Y1(:,4)+Y1(:,6);                    %Cdk1T
    Y1(:,34)=Y1(:,22)+Y1(:,23);       %APC:Cdh1T
    Y1(:,35)=Y1(:,19)+Y1(:,22)+Y1(:,23);  %Active APCT
    Y1(:,36)=Y1(:,9)+Y1(:,10);        %Wee1T
    Y1(:,37)=Y1(:,7)+Y1(:,8);         %Cdc25T
    Y1(:,38)=Y1(:,17)+Y1(:,18)+Y1(:,19)+Y1(:,31); %Cdc20T   
    Y1(:,39)=Y1(:,20)+Y1(:,21)+Y1(:,22)+Y1(:,23);  %Cdh1T
    Y1(:,40)=Y1(:,15)+Y1(:,16)+Y1(:,19)+Y1(:,22)+Y1(:,23);  %APCT
    Y1(:,41)=Y1(:,5)+Y1(:,6);         %p21T
    Y1(:,42)=Y1(:,11)+Y1(:,12)+Y1(:,29);         %Plk1T
    Y1(:,43)=Y1(:,24)+Y1(:,25);       %PTTG1T
    Y1(:,44)=Y1(:,13)+Y1(:,14);       %PP2AT
    Y1(:,45)=P0(105);                 %LMNAT
    Y1(:,46)=Y1(:,30)+Y1(:,31);       %MAD2T

    subplot('Position',fpos(no,:));
    hold on;
    pno=0;
    for i=nos
        pno=pno+1;
        pline(pno)=plot(time,Y1(:,i),'color',colors{i},'Linestyle',styles{i},...
              'linewidth',line_width);
    end
    %if no>2 
        xlabel('Time (hr)');
    %end
    ylabel('Relative concentrations');
    title(['{\it k_{s8}}=',num2str(P0(44))]);
    xlim([0 tlast]);
    ylim([0 1]);
    set(gca,'Xtick',0:12:tlast)
    set(gca,'LineWidth',1.5,'FontSize',12);

    %--------------------------------------------------------------
    % remove the Xticks that is located only at the upper side and 
    % the YTicks that is located right side of the plot.
    ax1 = gca;
    ax1.TickDir = 'out';
    set(ax1, 'box', 'off', 'color', 'none')
    ax2= axes('Position',get(ax1,'Position'),'LineWidth',1.5,'box','on','xtick',[],'ytick',[]);
    axes(ax1)
    linkaxes([ax1, ax2])
    %--------------------------------------------------------------
end % for k
annotation('textbox',[.1 .89 .1 .1],'String','A',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.48 .89 .1 .1],'String','B',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.1 .39 .1 .1],'String','C',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.48 .39 .1 .1],'String','D',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none') 
%-------------------------------------------------------------
% display legend
hL = legend(pline,legend_str,'Fontsize',11);
set(hL,'Box','off')
% Programatically move the Legend
set(hL,'Position', [0.8 0.75 0.2 0.2],'Units', 'normalized');

% make graph file
gfilename='Fig7.tif';
print(gfilename,'-dtiff', '-r300');  % 600 dpi is better
disp([gfilename ' is created']);

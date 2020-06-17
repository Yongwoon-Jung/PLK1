%-------------------------------------------------------------------------- 
% Plk1-p53 Model 
% File name: JUNG_FIG6_main
% Author: Yongwoon Jung
% Last updated: 6/17/2020
% function : Jung_eqn.m, JUNG_init_parameters, JUNG_constant_variables
% 1x2 graph% 31 initial values, 122 parametes
%-------------------------------------------------------------------------- 

clear;
clc;
close all;

disp('processing...');

global P0
JUNG_constant_variables

line_width=2;

% p21, Pttg1, cdc20, cdc25c
mut_nos=[5 24 17 8]; 
% ks5, p21 synthesis rate constant
% ks24, pttg1 synthesis rate constant
% ks17, Cdc20 synthesis rate constant
% ks8, Cdc25 synthesis rate constant
synthesis_nos=[43 51 49 44];
synthesis_val=[0 0 0 0];
%---------------------------------------------------------------
% if one of the mutations is zero
%---------------------------------------------------------------
figure(1);
set(figure(1),'Units','inches','Position',[0.5 0.5 11 8.5])
% Subplots at Custom Positions
% Specify pos as a four-element vector of the form [left bottom width height]
fpos=[0.1 0.6 0.3 0.35;
      0.48 0.6 0.3 0.35;
      0.1 0.1 0.3 0.35;
      0.48 0.1 0.3 0.35];
  
for no=1:length(mut_nos)
    
    JUNG_init_parameters
    P0(synthesis_nos(no))=synthesis_val(no);   
    % Simulation
    tlast=60;
    tspan=0:0.1:tlast;
    options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6, 'MaxStep', 1);
    CellCycleModel = @(t,y)(JUNG_eqn(t,y));

    [time,Y1] = ode15s(CellCycleModel,[nulltime 0],Y,options) ;
    NY=Y1(end,:);
    [time,Y1] = ode15s(CellCycleModel,tspan,NY,options) ;

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
    Y1(:,45)=1;                       %LMNAT
    Y1(:,46)=Y1(:,30)+Y1(:,31);       %MAD2T

    % plot  
    subplot('Position',fpos(no,:));

    hold on;

    nos=[3 5 6 7 9 19 28 29 30 31 34 42 43];
    pno=0;
    for i=nos
        pno=pno+1;
        pline(pno)=plot(time,Y1(:,i),'color',colors{i},'Linestyle',styles{i},...
              'linewidth',line_width);
        legend_str{pno}=concentration_str{i};
    end
    %MPF
    plot(time,Y1(:,3),'color',colors{3},'Linestyle',styles{3},'linewidth',5) 

    set(gca,'Fontsize',12);
    set(gca,'box','on','Xtick',0:12:tlast)
    xlabel('Time (hr)');
    ylabel('Relative concentrations');
    %title_str=strcat(concentration_str(mut_nos(no)),'  = 0');
    %title(title_str);

    xlim([0 tlast]);
    ylim([0 1]);
end  % for no end
annotation('textbox',[.1 .89 .1 .1],'String','A',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.48 .89 .1 .1],'String','B',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.1 .39 .1 .1],'String','C',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.48 .39 .1 .1],'String','D',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')     
%legend(legend_str,'location','southeastoutside','Fontsize',10);
%-------------------------------------------------------------
% display legend
hL = legend(pline,legend_str,'Fontsize',11);
set(hL,'Box','off')
% Programatically move the Legend
set(hL,'Position', [0.8 0.67 0.2 0.2],'Units', 'normalized');

%-------------------------------------------------------------
% make graph file
gfilename='FIG6.tif';
print(gfilename,'-dtiff', '-r300');  % 600 dpi is better
disp([gfilename ' is created']);

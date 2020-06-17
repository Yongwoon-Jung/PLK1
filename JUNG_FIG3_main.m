%-------------------------------------------------------------------------- 
% Plk1-p53 Model 
% File name: JUNG_FIG3_main
% Author: Yongwoon Jung
% Last updated: 6/17/2020
% function : Jung_eqn.m, JUNG_init_parameters, JUNG_constant_variables
% 31 initial values, 122 parametes
%-------------------------------------------------------------------------- 
clear;
clc;
close all;

disp('processing...');

global P0
JUNG_constant_variables

line_width=2;

options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6, 'MaxStep', 1);
CellCycleModel = @(t,y)(JUNG_eqn(t,y));

%---------------------------------------------------------------------------------------
% 2D graph (A, B, C, D)
%---------------------------------------------------------------------------------------
figure(1);
set(figure(1),'Units','inches','Position',[0.5 0.5 9 8.5])
hold on;
% Subplots at Custom Positions
% Specify pos as a four-element vector of the form [left bottom width height]
fpos=[0.1 0.74 0.27 0.2;
      0.48 0.74 0.27 0.2;
      0.1 0.43 0.27 0.2;
      0.48 0.43 0.27 0.2;
      0.1 0.08 0.27 0.25;
      0.5 0.08 0.27 0.25];
for figno=1:4   
    JUNG_init_parameters
    switch figno
        case 1   % fig A
            tlast=48;
        case 2   % fig B
            tlast=230;
            P0(46)=0.01;  %Plk1 synthesis rate constant
        case 3   % fig C   
            tlast=48;
            P0(53)=0;     %p53 synthesis rate constant
        case 4   % fig D
            tlast=230;
            P0(46)=0.01;  %Plk1 synthesis rate constant
            P0(53)=0;     %p53 synthesis rate constant
     end  % switch figno

    % Simulation
    tspan=0:0.1:tlast;
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
    subplot('Position',fpos(figno,:));
    hold on;
    nos=[7 19 27 28 30 31 42 3];
    pno=0;
    for i=nos
        pno=pno+1;
        pline(pno)=plot(time,Y1(:,i),'color',colors{i},'Linestyle',styles{i},...
              'linewidth',line_width);
        legend_str{pno}=concentration_str{i};
    end
    set(gca,'Fontsize',10);
    if (figno==2 || figno==4)
        set(gca,'box','on','Xtick',0:60:tlast)
    else
        set(gca,'box','on','Xtick',0:12:tlast)
    end
    xlabel('Time (hr)');
    ylabel('Relative concentrations');
    xlim([0 tlast]);
    if figno==4
        ylim([0 4]);
    else
        ylim([0 1]);
    end
end % for figno end
annotation('textbox',[.1 .88 .1 .1],'String','A',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.45 .88 .1 .1],'String','B',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.1 .57 .1 .1],'String','C',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.45 .57 .1 .1],'String','D',...
        'FontSize',12,'FontWeight','bold','EdgeColor','none') 
%-------------------------------------------------------------
% display legend
hL = legend(pline,legend_str,'Fontsize',10);
set(hL,'Box','off')
% Programatically move the Legend
set(hL,'Position', [0.77 0.74 0.2 0.2],'Units', 'normalized');
   
%---------------------------------------------------------------------------------------
% 3D graph (A', B') - p53, plk1T, Mad2ll:Cdc20P
%---------------------------------------------------------------------------------------
idx1=28;  % p53
idx2=42;  % plk1T
idx3=31;  % Mad2l1:Cdc20P

fcolor='r';
scolor='g';
ncolor='c';
msize=5;
label_fsize=11;

for figno=5:6
    JUNG_init_parameters
    switch figno
        case 5   % fig A'
            tlast=96;      
        case 6  % fig B'
            P0(46)=0.01;  %Plk1 synthesis rate constant
            tlast=230;
    end % switch end
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
    
    switch figno
        case 5   % fig A'
            flast=100;          % first
            slast=flast+100;    % second
            nlast=find(time==tlast/2);  % 48sec     
        case 6  % fig B'
            flast=1150;        % first
            slast=flast+50;    % second
            nlast=find(time==230);  % 480 sec
    end % switch end

    subplot('Position',fpos(figno,:));
    hold on;
    xlabel(concentration_str{idx1},'FontSize',label_fsize,'FontWeight','bold');
    ylabel(concentration_str{idx2},'FontSize',label_fsize,'FontWeight','bold');
    zlabel(concentration_str{idx3},'FontSize',label_fsize,'FontWeight','bold');
    grid on;
    for i=1:flast
        plot3(Y1(i,idx1),Y1(i,idx2),Y1(i,idx3),'-o','Color',fcolor,...
            'MarkerSize',msize,'MarkerFaceColor',fcolor)      
    end
    for i=flast+1:slast
        plot3(Y1(i,idx1),Y1(i,idx2),Y1(i,idx3),'-o','Color',scolor,...
            'MarkerSize',msize,'MarkerFaceColor',scolor)      
    end
    for i=slast+1:nlast
        plot3(Y1(i,idx1),Y1(i,idx2),Y1(i,idx3),'-o','Color','b',...
            'MarkerSize',msize,'MarkerFaceColor',ncolor)      
    end
    
    switch figno
        case 5   % fig A'
            view(-51,-44);     
        case 6  % fig B'
            view(29,39);
    end % switch end
end % for figno end
annotation('textbox',[.1 .23 .1 .1],'String','A''',...
    'FontSize',12,'FontWeight','bold','EdgeColor','none')
annotation('textbox',[.45 .23 .1 .1],'String','B''',...
    'FontSize',12,'FontWeight','bold','EdgeColor','none')

% make graph file
gfilename='FIG3.tif';
print(gfilename,'-dtiff', '-r300');  % 600 dpi is better
disp([gfilename ' is created']);

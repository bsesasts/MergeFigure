clc;clear;close all;  
x = 1:10;
y = 2 *x;
figure;
hold on;
plot(x,2*y);
plot(x,y);
xlabel('xxx');
ylabel('yyy');
title('ttt');
legend('hello','hi');
axis([-inf inf -1 45]);
set(gca,'XGrid','on','YGrid','on',...
    'XMinorTick','on','YMinorTick','on',...
    'TickDir','out','TickLength',[0.02 0.02],...
    'XColor',[.3 .3 .3],'YColor',[.3 .3 .3],'LineWidth',1);
saveas(gcf,'./1.fig');
figure;
hold on;
plot(x,5*y);
plot(x,3*y);
plot(x,1.5*y);
ylabel('2222');
saveas(gcf,'./2.fig');
% xx0 = findall(gcf);
figure;
surf(peaks);
set(gca,'XGrid','on','YGrid','on',...
    'XMinorTick','on','YMinorTick','on',...
    'TickDir','out','TickLength',[0.02 0.02],...
    'XColor',[.3 .3 .3],'YColor',[.3 .3 .3],'LineWidth',1);
xxx1 = findall(gcf);

title('peaks');
xlabel('xlabel');
ylabel('ylabel');
zlabel('zlabel');
% xx1
xxx3 = findall(gcf,'type','Line');
if(isempty(xxx3))
    aaa  = 1;
else
    aaa=2;
end
xxx2 = findall(gcf,'type','Surface')
% % xx2 = get(xx1,'CData')
saveas(gcf,'./3.fig');

open('./1.fig');   
figure = findall(gcf);
Flg = findall(gcf,'type','Legend');
Fax = findall(gcf,'type','Axes');
Fln=findall(gcf,'type','Line');
Ftx = findall(gcf,'type','Text');   % title/xlabel/ylabelµÄ±êÇ©
Ftb = findall(gcf,'type','Toolbar');
% delete('./1.fig');
fl_String = get(Flg,'String');

legend(fl_String);
xdata1 = get(figure_info,'xdata');   
ydata1 = get(figure_info,'ydata');   
color1 = get(figure_info,'color');   
subNum1 = length(xdata1);   
  
open('./2.fig')   
figure_info=findall(gcf,'type','line');    
xdata2 = get(figure_info,'xdata');   
ydata2 = get(figure_info,'ydata');   
color2 = get(figure_info,'color');   
subNum2 = length(xdata2);   
  
%%   
% close all;
figure;
subplot(2,1,1)   
for i=subNum1:-1:1   
    if length(xdata1{i})==1   
        break;   
    end   
    plot(xdata1{i},ydata1{i},'color',color1{i})   
    hold on;   
end   
title('(a). K-means (TF-IDF)')   
set(gca,'xtick',[]);   
set(gca,'ytick',[]);   
subplot(2,1,2)   
for i=subNum2:-1:1   
    if length(xdata2{i})==1   
        break;   
    end   
    plot(xdata2{i},ydata2{i},'color',color2{i})   
    hold on;   
end   
title('(b). Spectral Clustering (best)')   ;
set(gca,'xtick',[]);   
set(gca,'ytick',[]);   
axis on;   
% 
% figure;
% h = surf(peaks);
% colormap hsv
% % axis([-inf inf -1 45]);
%     set(gca,'XGrid','on','YGrid','on',...
%         'XMinorTick','on','YMinorTick','on',...
%         'TickDir','out','TickLength',[0.02 0.02],...
%         'XColor',[.3 .3 .3],'YColor',[.3 .3 .3],'LineWidth',1);
% tt = title('hhh');
% % Create the destination figure and axes:
% 
% fig = figure;
% ax = axes;
% % Copy the surface to the new axes and set properties that are not surface properties:
% % bb = copyobj(h,tt);
% new_handle = copyobj(h,ax);
% colormap(fig,hsv)
% view(ax,3);
% grid(ax,'on');
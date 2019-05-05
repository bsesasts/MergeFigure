%% Produce an image
% Two-dimensional maps of two-dimensional maps
% And have labels, axis settings, no label axis settings type
% Store as a fig file
clc;clear;close all;
% figure 1
figure;
x = 1:10;
y = 2 *x;
hold on;
plot(x,2*y);
plot(x,y);
xlabel('xxx');
ylabel('yyy');
title('line example');
legend('y = 2x','y = x');
axis([-inf inf -1 45]);
set(gca,'XGrid','on','YGrid','on',...
    'XMinorTick','on','YMinorTick','on',...
    'TickDir','out','TickLength',[0.02 0.02],...
    'XColor',[.3 .3 .3],'YColor',[.3 .3 .3],'LineWidth',1);
saveas(gcf,'./1.fig');
% figure 2
figure;
x = linspace(-2*pi,2*pi);
y1 = sin(x);
y2 = cos(x);
p = plot(x,y1,x,y2);
saveas(gcf,'./2.fig');
% figure 3
figure;
surf(peaks);
set(gca,'XGrid','on','YGrid','on',...
    'XMinorTick','on','YMinorTick','on',...
    'TickDir','out','TickLength',[0.02 0.02],...
    'XColor',[.3 .3 .3],'YColor',[.3 .3 .3],'LineWidth',1);
title('peaks');
xlabel('xlabel');
ylabel('ylabel');
zlabel('zlabel');
saveas(gcf,'./3.fig');
figure;
[X,Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
mesh(Z);
saveas(gcf,'./4.fig');

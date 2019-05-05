%% MergeFigure
% Copy the image of the original figure, properties to the new subplot
% figure
% Enter the subplot layout of the target figure and the figure number of
% the original figure
function MergeFigure(spa,spb,varargin)
close all;
shift_nargin = nargin-2;
for mfi = 1:shift_nargin
    % % Redraw to canvas
    this_figure = open(['./',num2str(varargin{mfi}),'.fig']);   % 打开figure
    Fln=findall(gcf,'type','Line');
    Fcd = findall(gcf,'type','Surface');
    if(~isempty(Fln))
        Line_Color = get(Fln,'Color');
        Line_Marker = get(Fln,'Marker');
        Flg = findall(gcf,'type','Legend');
        Fax = findall(gcf,'type','Axes');
        axess = get(Fax);
        Ftx = findall(gcf,'type','Text');
        if(mfi ~= 1)
            open('./obj.fig');
        end
        figure(25);
        subplot(spa,spb,mfi)
        % %     绘制线条
        for linei = 1:length(Fln)
            this_plot(linei) = plot(Fln(linei).XData,Fln(linei).YData);
            this_plot(linei).Color = Line_Color{linei};
            this_plot(linei).Marker = Line_Marker{linei}; %#ok<*AGROW>
            hold on;
        end
        hold off;
        % %     标注legend
        if(~isempty(Flg))
            this_legend = legend(Flg.String);
            set(this_legend,'Location',Flg.Location);
        end
        % %     标注axes包括title，label
        MigrateAxes(Fax,2);
    elseif(~isempty(Fcd))
        Fax = findall(gcf,'type','Axes');
        if(mfi ~= 1)
            open('./obj.fig');
        end
        figure(25);
        subplot(spa,spb,mfi);
        h = mesh(Fcd.ZData);
        fcdd = get(Fcd);
        this_fieldscd = fieldnames(fcdd);
        this_valuescd = struct2cell(fcdd);
        for cdi = 1:59
            except_list = [38 42 50 57];
            if(except(cdi,except_list))
                set(h,this_fieldscd{cdi},this_valuescd{cdi});
            end
        end
        MigrateAxes(Fax,3);
    end
    saveas(gcf,'./obj.fig');
end
% % 清空中间产物，只保留最后figure
close all;
open('./obj.fig');
end
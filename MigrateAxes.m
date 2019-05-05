function MigrateAxes(AxesFormer,d)
axesdata = get(AxesFormer);
axes_fields = fieldnames(axesdata);
axes_values = struct2cell(axesdata);
if(d == 2)
    except_list = [66 75 77 78 85 89 93 94 100 102 103 105 128 129];
elseif(d == 3)
    except_list = [75 77 78 85 89 93 94 100 102 103 105 128 129];
end
for axesi = 1:length(axes_fields)
    if(except(axesi,except_list))
        set(gca,axes_fields{axesi},axes_values{axesi});
    end
end
end
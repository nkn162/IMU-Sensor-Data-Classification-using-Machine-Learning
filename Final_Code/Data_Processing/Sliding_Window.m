function tables = Sliding_Window(filtered_data, sensor_name)
    window_length = 39;  % Since the reqd window size is 40 rows, kept as 39 since the starting row is inclusive
    l = length(filtered_data.([sensor_name '_Time'])) - window_length;
    num_blocks = 9;
    num_rows = ceil(l/7);

    var_names = {'Max', 'Min', 'Mean', 'RMS', 'MaxGrad', 'STD', 'ZC'};
    tables = struct();
    for v = 1:length(var_names)
        column_names = arrayfun(@(x) [var_names{v} '_' sensor_name num2str(x)], 1:num_blocks, 'UniformOutput', false);
        tables.(var_names{v}) = array2table(zeros(num_rows, num_blocks), 'VariableNames', column_names);
    end

    for row = 1:num_rows
        i = (row - 1) * 7 + 1;
        block_data = arrayfun(@(x) filtered_data.([sensor_name '_' num2str(x)])(i:i + window_length), 1:num_blocks, 'UniformOutput', false);
        [max_data, min_data, mean_data, rms_data, maxgrad_data, std_data, zc_data] = cellfun(@parameters, block_data, 'UniformOutput', false);
        
        for v = 1:length(var_names)
            tables.(var_names{v}){row, :} = cell2mat(eval([lower(var_names{v}) '_data']));
        end
    end
end

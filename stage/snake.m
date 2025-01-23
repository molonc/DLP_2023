function [stageOrder] = snake(rows,cols)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    stageOrder = {};
    for i = 1:rows
        for j = 1:cols
            if rem(i, 2) == 0 
                stageOrder{end+1} = [i cols - j+1];
            else
                stageOrder{end+1} = [i j];
            end
        end
    end
    stageOrder = reshape(cell2mat(stageOrder),2,rows*cols)';

    % test = zeros([rows cols]);
    % for i=1:length(stageOrder)
    %     test(stageOrder(i,1), stageOrder(i,2)) = 1
    %     pause(0.5)
    %     clc
    % end
end
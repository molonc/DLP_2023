function [stageOrder] = spiral(rows,cols)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    stageOrder = {};
    %Top row
    for i = 1:cols
        stageOrder{end+1} = [1 i];
    end
    %Right Column
    for i = 2:rows
        stageOrder{end+1} = [i cols];
    end
    %bottom row not including right column
    for i = 1:cols-1
        stageOrder{end+1} = [rows cols - i];
    end
    %left column not including top or bottom row
    for i = 1:rows-2
        stageOrder{end+1} = [rows - i 1];
    end
    for i = 2:rows-1
        for j = 2:cols-1
            if rem(i, 2) == 1 
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
    %OLD AND BROKEN :(((((
    % stageOrder = cell(rows*cols);
    % directions_row = [0 1 0 -1];
    % directions_col = [1 0 -1 0];
    % direction = 1; %initial direction = right
    % j =1;
    % k =1;
    % seen = zeros(rows,cols);
    % for i = 1:rows*cols
    %     stageOrder{i} = [j k];
    %     seen(j,k) = 1
    %     nj = j + directions_row(direction);
    %     nk = k + directions_col(direction);
    % 
    %     if 1 <= nk && nk <= cols  && 1<= nj && nj <= rows && ~(seen(nj,nk))
    %         j = nj;
    %         k = nk;
    %     else
    %         direction = rem(direction,4) + 1;
    %         j = j + directions_row(direction);
    %         k = k + directions_col(direction);
    %     end
    % 
    % 
    % end
    % 
    % stageOrder = reshape(cell2mat(stageOrder),2,rows*cols)';
end
function [full_wells] = get_filled_cells(excel_fullfile)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    selected = readtable("SmartChipData_A144197A.xlsx", 'Sheet','Selected_Spots');
    selected = table2array(selected(2:end,2:end));
    full_wells = find(selected ~= "~");
end
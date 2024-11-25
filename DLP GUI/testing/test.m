% FileName_excel = sprintf('SmartChipData_A%06iA.xls', 144181);
% fullFileName_excel = fullfile('C:\Users\Single Cell Scope\Desktop\image_analysis_test' ...
%     , FileName_excel);
% Primer_Tags = readtable(fullFileName_excel, 'Sheet', 4);
% Primernames = table2cell(Primer_Tags);
% % t = readtable(fullFileName_excel, 'Sheet', 2); % storing the Selected_Spots excel
% % names = table2cell(t);
% 
% disp(Primernames(5184,3:6));
% Read the cyan image
% Read the cyan image
% Load the Cyan and Green images
% Load images
image1 = imread('R09_C04_0000_00_Cyan.tif');
image2 = im2uint16(rgb2gray(imread('R20_C05_0000_00_Cyan.tif')));

% Check data type


% Display properties
disp(['Image 1: ', num2str(class(image1))]);
disp(['Image 2: ', num2str(class(image2))]);



max_intenisty_Cyan = max(max(image1));
disp(max_intenisty_Cyan);
max_intenisty_Cyan = max(max(image2));
disp(max_intenisty_Cyan);
% Combine the Cyan and Green images to form the color image

% color_image = imresize( color_image, [fixedHeight, fixedWidth]);
% Calculate the center of the image
% centerX = size(color_image, 2) / 2;
% centerY = size(color_image, 1) / 2;

% Define the radius of the circle
% radius =40;
% 
% % Add a green circle to the image
% color_image = insertShape(color_image, 'circle', [centerX, centerY, radius], 'Color', 'red',LineWidth=3 );

% Display the color image
imshow(color_image);
title('Color Image with Green Circle');


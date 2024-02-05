%info = imaqhwinfo
vid = videoinput('pointgrey', 1);
%videoinput()
% Set up video object properties (adjust as needed)
vid.FramesPerTrigger = Inf;
vid.ReturnedColorspace = 'rgb';
src = getselectedsource(vid);
src.Exposure = 0.0386;
get(src);
% Testing the Lasers 
laser_serial = serialport('COM3', 9600);
fopen(laser_serial)
laser_serial.DataBits = 8;
laser_serial.Parity = 'none';
laser_serial.StopBits = 1;
laser_serial.FlowControl = 'none';
configureTerminator(laser_serial, 13);

% Initialize commands
initCmd1 = '57 02 FF 50';
initCmd2 = '57 03 AB 50';

% Write commands to the serial port
writeline(laser_serial, initCmd1);
writeline(laser_serial, initCmd2);


blueOnCmd = sscanf('4F 5F 50', '%2X'); % hex values for serial communication
fwrite(laser_serial, blueOnCmd, 'uint8');


% get(vid);
% Start the video input object for preview
preview(vid);

bluePowerDec = 130; %get value for intensity (on scale of 0-255) 
bluePowerHex = dec2hex(255-bluePowerDec, 2); %convert intensity to a hex value
powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
fwrite(laser_serial, powerBlue, 'uint8');

pause(60);

allOffCmd = sscanf('4F 7F 50', '%2X');
fwrite(laser_serial, allOffCmd, 'uint8');

delete(laser_serial)
clear laser_serial
% Get the live image
            
% Get the selected source and set ExposureTimeControl

% src = getselectedsource(app.vidobj);
% src.ExposureTimeControl = 'normal';
% 
% Create a figure with UIAxes to display the live image
% hFigure = uifigure('Name', 'Live Image with Squares');
% hAxes = uiaxes('Parent', hFigure, 'Position', [10, 10, 400, 300], 'Tag', 'UIAxes1');
% 
% % Continuous update loop
% while ishandle(hFigure)
%     % Get the live image
%     liveImage = getsnapshot(app.vidobj);
%     src.ExposureTime = (app.ExposureTimemsEditField.Value) / 100; % Convert from ms to seconds
% 
%     % Add squares to indicate cell alignment
%     [rows, cols, ~] = size(liveImage);
%     portionRows = rows / 3;
%     portionCols = cols / 2;
% 
%     for i = 1:3
%         for j = 1:2
%             % Calculate square coordinates
%             startRowSquare = (i - 1) * portionRows + 1;
%             endRowSquare = i * portionRows;
%             startColSquare = (j - 1) * portionCols + 1;
%             endColSquare = j * portionCols;
% 
%             % Draw a square on the live image using rectangle
%             rectangle(hAxes, 'Position', [startColSquare, startRowSquare, portionCols, portionRows], 'EdgeColor', 'r', 'LineWidth', 2);
%         end
%     end
% 
%     % Display the live image with squares
%     imshow(liveImage, 'Parent', hAxes);
% 
%     % Optional: Pause to control the update rate
%     pause(0.1); % Adjust as needed
% end
% 
% % Close the live preview when the loop breaks
% closepreview(app.vidobj);
% 

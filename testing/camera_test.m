%info = imaqhwinfo
vid = videoinput('winvideo', 1,'RGB32_1920x1144');
%videoinput()
% Set up video object properties (adjust as needed)
vid.FramesPerTrigger = Inf;
vid.ReturnedColorspace = 'rgb';

  
% Start the video input object for preview
preview(vid);
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

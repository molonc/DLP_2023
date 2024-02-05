function testing_r2                                                          
    % I = imread('1.png');
    % splitAndSaveImage(I);
    
    %% laser Connection
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
    % 
    % %% Stage Connection
    % 
    % Create a serial port object
    % stage = serialport('COM4', 115200);
    % configureTerminator(stage, "CR");  % Set Carriage Return as the terminator
    % timeoutDuration = 10;  % Set timeout duration in seconds
    % stage.Timeout = timeoutDuration;
    % % 
    % %% Camera Connection 
    % 
    % % vid = videoinput('winvideo', 1,'RGB32_1920x1200'); % Changed to 1200 from 1140 on Jan 15 
    % vid = videoinput('winvideo', 1); % try this also
    % % Set up video object properties (adjust as needed)
    % get(vid)
    % vid.FramesPerTrigger = Inf;
    % vid.ReturnedColorspace = 'rgb';
    % vid.Exposure = 2;

    %% Microscope Connection --> Success it works exactly as written !!!!

    % scope = actxserver('Nikon.TiScope.NikonTi');


    %% Testing Begins!! (use scope testing to check the status of the shutters)

    turnlaserson(laser_serial);
    delete(laser_serial)
    clear laser_serial

    % movescopeBy(scope); %works
    % movescopeTo(scope); %works
    % Release the ActiveX server
    
    % release(scope);

    % liveviewwithSquares(vid); %doesn't work
    % takeandsaveimage(vid); % works
    % testImageSplitting(vid); % kinda works
    % testExposureAdjustment(vid)


    % movestageBy(stage);
    % movestageBy(stage);  
    % movestageTo(stage); %works
    % 
    % %Save some positions to a mat file
    % positionX = 0; % 100000 moves it to position 10mm not that this overly matters since i think it returns 100000
    % positionY = 0;
    % save('stage_positions.mat', 'positionX', 'positionY');
    % 
    % movestagetoMat(stage); %works

    % delete(stage);
    % clear stage;

end

function turnlaserson(laser_serial)

    blueOnCmd = sscanf('4F 5F 50', '%2X'); % hex values for serial communication
    fwrite(laser_serial, blueOnCmd, 'uint8');

    bluePowerDec = 130; %get value for intensity (on scale of 0-255) 
    bluePowerHex = dec2hex(255-bluePowerDec, 2); %convert intensity to a hex value
    powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
    fwrite(laser_serial, powerBlue, 'uint8');

    pause(10);
    
    allOffCmd = sscanf('4F 7F 50', '%2X');
    fwrite(laser_serial, allOffCmd, 'uint8');
    
    disp("Disable All Command Sent");
    
    % pause(10)
    % 
    % disp("Now Shutting power to Zero");
    % 
    % 
    % bluePowerDec = 0; %get value for intensity
    % bluePowerHex = dec2hex(255-bluePowerDec, 2); %convert intensity to a hex value
    % powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
    % fwrite(laser_serial, powerBlue, 'uint8');
    % 
    % pause(5);

    % turnlaseroff(laser_serial);

    % cyanOnCmd = sscanf('4F 7B 50', '%2X'); % hex values for serial communication
    % fwrite(laser_serial, cyanOnCmd, 'uint8');
    % 
    % cyanPowerDec = 130;
    % cyanPowerHex = dec2hex(255-cyanPowerDec, 2);
    % powerCyanCmd = sscanf(['53 18 03 02 F', cyanPowerHex, '0 50'], '%2X');
    % fwrite(laser_serial, powerCyanCmd, 'uint8');
    % 
    % pause(5);
    % allOffCmd = sscanf('4F 7F 50', '%2X');
    % fwrite(laser_serial, allOffCmd, 'uint8');
    % 
    % disp("Disable All Command Sent");
    % 
    % pause(10)
    % 
    % disp("Now Shutting power to Zero");
    % 
    % 
    % bluePowerDec = 0; %get value for intensity
    % bluePowerHex = dec2hex(255-bluePowerDec, 2); %convert intensity to a hex value
    % powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
    % fwrite(laser_serial, powerBlue, 'uint8');
    % % 
    % pause(5);
    % 
    % greenOnCmd = sscanf('4F 7D 50', '%2X'); % hex values for serial communication
    % fwrite(laser_serial, greenOnCmd, 'uint8');  
    % 
    % greenPowerDec = 130;
    % greenPowerHex = dec2hex(255-greenPowerDec, 2);
    % powerGreenCmd = sscanf(['53 18 03 04 F', greenPowerHex, '0 50'], '%2X');
    % fwrite(laser_serial, powerGreenCmd, 'uint8'); 
    % 
    % pause(5);
    % allOffCmd = sscanf('4F 7F 50', '%2X');
    % fwrite(laser_serial, allOffCmd, 'uint8');
    % 
    % disp("Disable All Command Sent");
    % 
    % pause(10)
    % 
    % disp("Now Shutting power to Zero");
    % 
    % 
    % bluePowerDec = 0; %get value for intensity
    % bluePowerHex = dec2hex(255-bluePowerDec, 2); %convert intensity to a hex value
    % powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
    % fwrite(laser_serial, powerBlue, 'uint8');
    % 
    % pause(5);  

end

function turnlaseroff(laser_serial)
    allOffCmd = sscanf('4F 7F 50', '%2X');
    fwrite(laser_serial, allOffCmd, 'uint8');
end



function testExposureAdjustment(vidobj)
    % Function to test live preview and exposure adjustment
    
    % Start live preview
    hFig = figure('Name', 'Live Preview', 'NumberTitle', 'off', 'MenuBar', 'none');
    hAxes = axes('Parent', hFig);
    hPreview = preview(vidobj, hAxes);
    
    % Create a UI for exposure adjustment
    hSlider = uicontrol('Style', 'slider', 'Min', 1, 'Max', 1000, ...
        'Value', vidobj.Exposure, 'Position', [10, 10, 120, 20], ...
        'Callback', @updateExposure);
    hLabel = uicontrol('Style', 'text', 'String', ['Exposure: ' num2str(vidobj.Exposure)], ...
        'Position', [140, 10, 120, 20]);
    
    % Wait for the user to close the figure
    uiwait(hFig);
    
    % Cleanup: Stop live preview
    stoppreview(vidobj);
    delete(hFig);

    function updateExposure(~, ~)
        % Callback function to update exposure when the slider is moved
        newExposureValue = round(get(hSlider, 'Value'));
        vidobj.Exposure = newExposureValue;
        set(hLabel, 'String', ['Exposure: ' num2str(newExposureValue)]);
    end
end

function movescopeBy(scope)
    currentPosition = get(scope.ZDrive.Position, 'DisplayString');

    distanceToMove = input('Enter the distance to move (in micrometers): ');
    % Move ZDrive __ micrometers up
    distanceToMove = (distanceToMove/2.5)*100;

    scope.ZDrive.MoveRelative(distanceToMove);

    % Pause for a moment to allow the ZDrive to move
    pause(2);

    % Get the new position of ZDrive
    newPosition = get(scope.ZDrive.Position, 'DisplayString');

    % Display the new position
    disp(['ZDrive moved from ' num2str(currentPosition) ' to ' num2str(newPosition) ' micrometers.']);
end
%% Been Tested 



function movescopeTo(scope)
    currentPosition = get(scope.ZDrive.Position, 'DisplayString');

    distanceToMove = input('Enter the position desired (in micrometers): ');
    % Move ZDrive 50 micrometers up
    distanceToMove = (distanceToMove/2.5)*100;

    scope.ZDrive.MoveAbsolute(distanceToMove);

    % Pause for a moment to allow the ZDrive to move
    pause(2);

    % Get the new position of ZDrive
    newPosition = get(scope.ZDrive.Position, 'DisplayString');

    % Display the new position
    disp(['ZDrive moved from ' num2str(currentPosition) ' to ' num2str(newPosition) ' micrometers.']);
end

function liveviewwithSquares(vidobj)
    % Create a figure with UIAxes to display the live image
    hFigure = uifigure('Name', 'Live Image with Squares');
    hAxes = uiaxes('Parent', hFigure, 'Position', [10, 10, 400, 300], 'Tag', 'UIAxes1');

    % Add a figure close request function
    hFigure.CloseRequestFcn = @(src, event) closeFigure(src, vidobj);

    % Draw the initial grid lines
    drawGridLines(hAxes);

    % Continuous update loop
    while ishandle(hFigure)
        % Get the live image
        liveImage = getsnapshot(vidobj);

        % Check if figure and axes are still valid
        if ishandle(hFigure) && ishandle(hAxes)
            % Update only the image behind the grid lines
            if isempty(hAxes.Children)
                % First time, create the image object
                hImage = imshow(liveImage, 'Parent', hAxes);
            else
                % Update CData of the existing image object
                hImage.CData = liveImage;
            end
        else
            break; % Exit the loop if figure or axes is closed
        end

        % Optional: Pause to control the update rate
        pause(0.1); % Adjust as needed
    end
end

function drawGridLines(hAxes)
    % Add squares to indicate cell alignment
    portionRows = 1200 / 3;  % Assuming image size is 1920x1200
    portionCols = 1920 / 2;

    for i = 1:3
        for j = 1:2
            % Calculate square coordinates
            startRowSquare = (i - 1) * portionRows + 1;
            startColSquare = (j - 1) * portionCols + 1;

            % Draw a square on the live image using rectangle
            rectangle(hAxes, 'Position', [startColSquare, startRowSquare, portionCols, portionRows], 'EdgeColor', 'r', 'LineWidth', 2);
        end
    end
end

function closeFigure(fig, vidobj)
    % Close the live preview when the figure closes
    closepreview(vidobj);
    delete(fig);
end


function takeandsaveimage(vid) % works 
    % Capture an image
    image = getsnapshot(vid);

    % Prompt the user for a file name
    [filename, pathname] = uiputfile({'*.png'; '*.jpg'; '*.bmp'}, 'Save Image As', 'captured_image.png');

    % Check if the user clicked Cancel
    if isequal(filename,0) || isequal(pathname,0)
        disp('User canceled the operation. Image not saved.');
        return;
    end

    % Construct the full file path
    fullpath = fullfile(pathname, filename);

    % Save the image to the selected file
    imwrite(image, fullpath);

    % Display a message indicating successful save
    disp(['Image saved to: ', fullpath]);
end

function movestageBy(stage)
    writeline(stage, 'WHERE X Y Z');
    
    response = readline(stage);  
    disp(response);

    distanceToMoveX = input('Enter the distance to move X (in micrometers): ');
    distanceToMoveY = input('Enter the distance to move Y (in micrometers): ');
    command = sprintf('R X=%.2f Y=%.2f Z', distanceToMoveX,distanceToMoveY); % I think it needs to be done like this 
    writeline(stage, command);
    response = readline(stage); 
    % command = sprintf('R Y=%.2f', distanceToMoveY);
    % writeline(stage, command);
    writeline(stage, '/');
    response = readline(stage);  
    while isequal(response,'N')
        writeline(stage, '/');
        response = readline(stage);
    end

    writeline(stage, 'WHERE X Y Z');

    response = readline(stage);  
    disp(response);
    % we need to grab the response from the stage after each command no
    % matter if it is irrelevant therefore the above code works :) 
end

function movestageTo(stage) %this works
    positionX = input('Enter the X position: ');
    positionY = input('Enter the Y position: ');

    command = sprintf('M X=%.2f Y=%.2f', positionX, positionY);
    writeline(stage, command);
    response = readline(stage);

    writeline(stage, '/');
    response = readline(stage);  
    while isequal(response,'N')
        writeline(stage, '/');
        response = readline(stage);
    end
    
    writeline(stage, 'W X Y Z');
    response = readline(stage);
    disp(response);

    % Extract numerical values from the response using regular expressions
    pattern = '(-?\d+)';  % Match one or more digits, optionally preceded by a minus sign
    matches = regexp(response, pattern, 'tokens');

    % Convert the matched strings to numeric values
    currentPosition = cellfun(@str2double, matches);

    % Display the extracted values
    disp('Extracted Positions:');
    disp(currentPosition);
end

function movestagetoMat(stage)
    loadedData = load('stage_positions.mat');
    command = sprintf('M X=%.2f Y=%.2f', loadedData.positionX, loadedData.positionY);
    writeline(stage, command);
    response = readline(stage);

    writeline(stage, '/');
    response = readline(stage);  
    while isequal(response,'N')
        writeline(stage, '/');
        response = readline(stage);
    end

    writeline(stage, 'WHERE X Y');
    response = readline(stage);
    % Extract numerical values from the response using regular expressions
    pattern = '(-?\d+)';  % Match one or more digits, optionally preceded by a minus sign
    matches = regexp(response, pattern, 'tokens');

    % Convert the matched strings to numeric values
    currentPosition = cellfun(@str2double, matches);
    position = currentPosition; 
    disp(['X = ' num2str(position(1)) ', Y = ' num2str(position(2))]);
end

function testImageSplitting(vidobj) %unsure if this works 
    % Capture an image using the provided video object
    inputImage = getsnapshot(vidobj);

    % Display the input image
    figure;
    subplot(2, 3, 1);
    imshow(inputImage, 'InitialMagnification', 'fit');
    title('Original Image');

    % Simulate the image splitting process
    splitImage = splitAndSaveImage(inputImage);

    % Display the split images in a 2x3 matrix
    for i = 1:2
        for j = 1:3
            % Calculate the current subplot index
            subplotIndex = (i - 1) * 3 + j + 1;

            % Check if the subplot index is within bounds
            if subplotIndex <= numel(splitImage)
                subplot(2, 3, subplotIndex);
                imshow(splitImage{i, j}, 'InitialMagnification', 'fit');
                title(['Split ' num2str(i) '-' num2str(j)]);
            end
        end
    end
end


function splitImage = splitAndSaveImage(inputImage) % this works given an input image 
    % Get the size of the input image
    [rows, cols, ~] = size(inputImage);

    % Ensure the image can be evenly split into a 2x3 grid
    if mod(rows, 2) ~= 0 || mod(cols, 3) ~= 0
        error('Image size is not suitable for splitting into a 2x3 grid.');
    end

    % Calculate the size of each portion
    portionRows = rows / 2;
    portionCols = cols / 3;

    % Initialize the output cell array to store the portions
    splitImage = cell(1, 6);

    % Split the image into 2x3 portions
    for i = 1:2
        for j = 1:3
            % Calculate the indices for each portion
            startRow = round((i - 1) * portionRows) + 1;
            endRow = round(i * portionRows);
            startCol = round((j - 1) * portionCols) + 1;
            endCol = round(j * portionCols);

            % Extract the portion from the input image
            splitImage{(i - 1) * 3 + j} = inputImage(startRow:endRow, startCol:endCol, :);
        end
    end

    % Save the split images
    saveSplitImages(splitImage, rows, cols);
end

function saveSplitImages(splitImage, rows, cols) % this also works 
    % Set folder path (replace this with your actual folder path)
    outputFolder = 'SplitImages';

    % Create the folder if it doesn't exist
    if ~exist(outputFolder, 'dir')
        mkdir(outputFolder);
    end

    % Save the split images
    for k = 1:numel(splitImage)
        fileName = sprintf('Image_Row%d_Col%d_Part%d.tif', rows, cols, k);
        fullFileName = fullfile(outputFolder, fileName);
        imwrite(splitImage{k}, fullFileName);
    end
end
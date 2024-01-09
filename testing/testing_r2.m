function testing_r2 
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

    %% Stage Connection

    % Create a serial port object
    stage = serialport('COM4', 115200);
    configureTerminator(stage, "CR");  % Set Carriage Return as the terminator
    timeoutDuration = 10;  % Set timeout duration in seconds
    stage.Timeout = timeoutDuration;

    %% Camera Connection 
    vid = videoinput('winvideo', 1,'RGB32_1920x1144');
    % Set up video object properties (adjust as needed)
    vid.FramesPerTrigger = Inf;
    vid.ReturnedColorspace = 'rgb';

    %% Microscope Connection 

    scope = actxserver('Nikon.TiScope.NikonTi');


    %% Testing Begins!!

    turnlaserson(laser_serial);
    movescopeBy(scope);
    movescopeTo(scope);
    liveviewwithSquares(vid);


end

function turnlaserson(laser_serial)

    blueOnCmd = sscanf('4F 5F 50', '%2X'); % hex values for serial communication
    fwrite(laser_serial, blueOnCmd, 'uint8');

    bluePowerDec = 130; %get value for intensity (on scale of 0-255) 
    bluePowerHex = dec2hex(255-bluePowerDec, 2); %convert intensity to a hex value
    powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
    fwrite(laser_serial, powerBlue, 'uint8');

    pause(2);

    turnlaseroff(laser_serial);

    cyanOnCmd = sscanf('4F 7B 50', '%2X'); % hex values for serial communication
    fwrite(laser_serial, cyanOnCmd, 'uint8');
    
    cyanPowerDec = 130;
    cyanPowerHex = dec2hex(255-cyanPowerDec, 2);
    powerCyanCmd = sscanf(['53 18 03 02 F', cyanPowerHex, '0 50'], '%2X');
    fwrite(laser_serial, powerCyanCmd, 'uint8');
    
    pause(2);

    turnlaseroff(laser_serial);
    
    greenOnCmd = sscanf('4F 7D 50', '%2X'); % hex values for serial communication
    fwrite(laser_serial, greenOnCmd, 'uint8');  

    greenPowerDec = 130;
    greenPowerHex = dec2hex(255-greenPowerDec, 2);
    powerGreenCmd = sscanf(['53 18 03 04 F', greenPowerHex, '0 50'], '%2X');
    fwrite(laser_serial, powerGreenCmd, 'uint8'); 

    pause(2);

    turnlaseroff(laser_serial);    

end

function turnlaseroff(laser_serial)
    allOffCmd = sscanf('4F 7F 50', '%2X');
    fwrite(laser_serial, allOffCmd, 'uint8');
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

function movescopeTo(scope)
    currentPosition = get(scope.ZDrive.Position, 'DisplayString');

    distanceToMove = input('Enter the position desired (in micrometers): ');
    % Move ZDrive 50 micrometers up
    distanceToMove = (distanceToMove/2.5)*100;

    scope.ZDrive.MoveRelative(distanceToMove);

    % Pause for a moment to allow the ZDrive to move
    pause(2);

    % Get the new position of ZDrive
    newPosition = get(scope.ZDrive.Position, 'DisplayString');

    % Display the new position
    disp(['ZDrive moved from ' num2str(currentPosition) ' to ' num2str(newPosition) ' micrometers.']);
end

function liveviewwithSquares(vidobj)
    src = getselectedsource(vidobj);
    src.ExposureTimeControl = 'normal';

    % Create a figure with UIAxes to display the live image
    hFigure = uifigure('Name', 'Live Image with Squares');
    hAxes = uiaxes('Parent', hFigure, 'Position', [10, 10, 400, 300], 'Tag', 'UIAxes1');

    % Continuous update loop
    while ishandle(hFigure)
        % Get the live image
        liveImage = getsnapshot(vidobj);
        exptime = input('Enter the Exposure time (in milliseconds): ');
        src.ExposureTime = (exptime) / 1000; % Convert from milliseconds to seconds

        % Add squares to indicate cell alignment
        [rows, cols, ~] = size(liveImage);
        portionRows = rows / 3;
        portionCols = cols / 2;

        for i = 1:3
            for j = 1:2
                % Calculate square coordinates
                startRowSquare = (i - 1) * portionRows + 1;
                startColSquare = (j - 1) * portionCols + 1;
        
                % Draw a square on the live image using rectangle
                rectangle(hAxes, 'Position', [startColSquare, startRowSquare, portionCols, portionRows], 'EdgeColor', 'r', 'LineWidth', 2);
            end
        end

        % Display the live image with squares
        imshow(liveImage, 'Parent', hAxes);

        % Optional: Pause to control the update rate
        pause(0.1); % Adjust as needed
    end

    % Close the live preview when the loop breaks
    closepreview(vidobj);
end

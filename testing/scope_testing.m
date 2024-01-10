try
    % Try to create an instance of the Nikon TiScope
    scope = actxserver('Nikon.TiScope.NikonTi');
    
    % Get the current position of ZDrive
    currentPosition = get(scope.ZDrive.Position, 'DisplayString');

    % distanceToMove = input('Enter the distance to move (in micrometers): ');
    % % Move ZDrive 50 micrometers up
    % distanceToMove = (distanceToMove/2.5)*100;
    % 
    % scope.ZDrive.MoveRelative(distanceToMove);
    % 
    % % Pause for a moment to allow the ZDrive to move
    % pause(2);
    % 
    % % Get the new position of ZDrive
    % newPosition = get(scope.ZDrive.Position, 'DisplayString');
    % 
    % % Display the new position
    % disp(['ZDrive moved from ' num2str(currentPosition) ' to ' num2str(newPosition) ' micrometers.']);
    % laser_serial = serialport('COM3', 9600);
    % fopen(laser_serial)
    % laser_serial.DataBits = 8;
    % laser_serial.Parity = 'none';
    % laser_serial.StopBits = 1;
    % laser_serial.FlowControl = 'none';
    % configureTerminator(laser_serial, 13);
    % 
    % % Initialize commands
    % initCmd1 = '57 02 FF 50';
    % initCmd2 = '57 03 AB 50';
    % 
    % % Write commands to the serial port
    % writeline(laser_serial, initCmd1);
    % writeline(laser_serial, initCmd2);
    
    %get(scope.Lasers.Connect(laser_serial),'DisplayString');
    % Open the AuxShutter if mounted
% Check the value of AuxShutter.IsOpened
    disp(['AuxShutter.IsOpened: ' get(scope.AuxShutter.IsOpened, 'DisplayString')]);
    
    % Open the AuxShutter if mounted
    if strcmp(get(scope.AuxShutter.IsOpened, 'DisplayString'), '0')
        scope.AuxShutter.Open();
        disp('AuxShutter opened.');
    end
    
    % Check the value of DiaShutter.IsOpened
    disp(['DiaShutter.IsOpened: ' get(scope.DiaShutter.IsOpened, 'DisplayString')]);
    
    % Open the DiaShutter if not opened
    if strcmp(get(scope.DiaShutter.IsOpened, 'DisplayString'), '0')
        scope.DiaShutter.Open();
        disp('DiaShutter opened.');
    end
    
    % Check the value of EpiShutter.IsOpened
    disp(['EpiShutter.IsOpened: ' get(scope.EpiShutter.IsOpened, 'DisplayString')]);
    
    % Open the EpiShutter if not opened
    if strcmp(get(scope.EpiShutter.IsOpened, 'DisplayString'), '0')
        scope.EpiShutter.Open();
        disp('EpiShutter opened.');
    end
    
    % Check the value of FiberIlluminator.IsOpened
    disp(['FiberIlluminator.IsOpened: ' get(scope.FiberIlluminator.IsOpened, 'DisplayString')]);
    
    % Open the FiberIlluminator if not opened
    if strcmp(get(scope.FiberIlluminator.IsOpened, 'DisplayString'), '0')
        scope.FiberIlluminator.Open();
        disp('FiberIlluminator opened.');
    end
    
    % Release the ActiveX server
    release(scope);
    % Release the ActiveX server
    release(scope);
catch exception
    % Display error message
    disp(['Error: ' exception.message]);
    release(scope);
end

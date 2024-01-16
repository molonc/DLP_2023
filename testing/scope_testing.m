try
    % Try to create an instance of the Nikon TiScope
    scope = actxserver('Nikon.TiScope.NikonTi');
    
    % Get the current position of ZDrive
    currentPosition = get(scope.ZDrive.Position, 'DisplayString');
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
    shutterstatus = get(scope.Laser.IsOpenShutter,'DisplayString');
    disp(shutterstatus);
    
    scope.Lasers.Connect(laser_serial);
catch exception
    % Display error message
    disp(['Error: ' exception.message]);
    
end

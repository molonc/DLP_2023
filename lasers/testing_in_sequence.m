% Testing the Lasers 
laser_serial = serialport('COM3', 9600);
fopen(laser_serial)
laser_serial.DataBits = 8;
laser_serial.Parity = 'none';
laser_serial.StopBits = 1;
laser_serial.FlowControl = 'none';
configureTerminator(laser_serial, 13);

% Write commands to the serial port
% inititalization commands
initCmd1 = sscanf('57 02 FF 50', '%2X');
initCmd2 = sscanf('57 03 AB 50', '%2X');
fwrite(laser_serial, initCmd1, 'uint8');
fwrite(laser_serial, initCmd2, 'uint8');

% enabling Green 
greenOnCmd = sscanf('4F 7D 50', '%2X'); % hex values for serial communication
fwrite(laser_serial, greenOnCmd, 'uint8');

% powering green 
greenPowerDec = 255;
greenPowerHex = dec2hex(255-greenPowerDec, 2);
powerGreenCmd = sscanf(['53 18 03 04 F', greenPowerHex, '0 50'], '%2X');
fwrite(laser_serial, powerGreenCmd, 'uint8');

pause(.1);
% disable command
allOffCmd = sscanf('4F 7F 50', '%2X');
fwrite(laser_serial, allOffCmd, 'uint8');

% Enabling Cyan 
cyanOnCmd = sscanf('4F 7B 50', '%2X'); % hex values for serial communication
fwrite(laser_serial, cyanOnCmd, 'uint8');

% powering cyan 
cyanPowerDec = 255;
cyanPowerHex = dec2hex(255-cyanPowerDec, 2);
powerCyanCmd = sscanf(['53 18 03 02 F', cyanPowerHex, '0 50'], '%2X');
fwrite(laser_serial, powerCyanCmd, 'uint8');

pause(2);
% disabling 
allOffCmd = sscanf('4F 7F 50', '%2X');
fwrite(laser_serial, allOffCmd, 'uint8');

delete(laser_serial)
clear laser_serial


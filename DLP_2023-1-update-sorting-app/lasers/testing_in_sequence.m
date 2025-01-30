% Testing the Lasers
laser_serial = serialport('COM3', 9600);
fopen(laser_serial);
laser_serial.DataBits = 8;
laser_serial.Parity = 'none';
laser_serial.StopBits = 1;
laser_serial.FlowControl = 'none';
configureTerminator(laser_serial, 13);

% Write commands to the serial port
% Initialization commands
initCmd1 = sscanf('57 02 FF 50', '%2X');
initCmd2 = sscanf('57 03 AB 50', '%2X');
fwrite(laser_serial, initCmd1, 'uint8');
fwrite(laser_serial, initCmd2, 'uint8');

% Enabling Green and Cyan simultaneously
greenAndCyanOnCmd = sscanf('4F 79 50', '%2X'); % Enable Green and Cyan (bit 1 and bit 2)
fwrite(laser_serial, greenAndCyanOnCmd, 'uint8');

% Powering both Green and Cyan
greenAndCyanPowerDec = 255; % Maximum intensity
greenAndCyanPowerHex = dec2hex(255 - greenAndCyanPowerDec, 2);
powerGreenAndCyanCmd = sscanf(['53 18 03 06 F', greenAndCyanPowerHex, '0 50'], '%2X'); % Setting intensity for both Green and Cyan
fwrite(laser_serial, powerGreenAndCyanCmd, 'uint8');

pause(2);

% Disabling both lasers
allOffCmd = sscanf('4F 7F 50', '%2X');
fwrite(laser_serial, allOffCmd, 'uint8');

fclose(laser_serial);
delete(laser_serial);
clear laser_serial;


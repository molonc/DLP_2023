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

%blueOnCmd = '4F 5F 50'
%write
tempCmd = sscanf('53 91 02 50', '%2X');
fwrite(laser_serial, tempCmd, 'uint8');
tempData = fread(laser_serial, 2, 'char');
first11MSB = tempData(1) * 8 + bitsra(tempData(2), 5);
temperature = first11MSB * 0.125;
disp(['The temperature of the laser control box (oC): ', num2str(temperature)]);


blueOnCmd = sscanf('4F 5F 50', '%2X'); % hex values for serial communication
fwrite(laser_serial, blueOnCmd, 'uint8');

bluePowerDec = 130; %get value for intensity (on scale of 0-255) 
bluePowerHex = dec2hex(255-bluePowerDec, 2); %convert intensity to a hex value
powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
fwrite(laser_serial, powerBlue, 'uint8');

pause(30);

allOffCmd = sscanf('4F 7F 50', '%2X');
fwrite(laser_serial, allOffCmd, 'uint8');

disp("Disable All Command Sent");
pause(10)

disp("Now Shutting power to Zero");


bluePowerDec = 0; %get value for intensity
bluePowerHex = dec2hex(255-bluePowerDec, 2); %convert intensity to a hex value
powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
fwrite(laser_serial, powerBlue, 'uint8');

delete(laser_serial)
clear laser_serial



% app.laserconnectionLabel.FontColor = "#77AC30";
% app.laserconnectionLabel.Text = "Connected";

% function connect_lasers_callback(src)
%     data = fread(src, src.BytesAvailable);
%     disp(['Received data: ' string(data)])
% end
function [hObject, handles] = powerGreen(hObject, handles)
    greenPowerDec = get(BLUEEditField, 'String');
    greenPowerHex = dec2hex(255-greenPowerDec, 2);
    powerGreenCmd = sscanf(['53 18 03 04 F', greenPowerHex, '0 50'], '%2X');
    fwrite(app.laser, powerGreenCmd, 'uint8');
end
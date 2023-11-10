function [app] = powerBlue(app)
    bluePowerDec = get(app.BLUEEditField); %get value for intensity
    bluePowerHex = dec2hex(255-bluePowerDec, 2); %convert intensity to a hex value
    powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
    fwrite(app.laser, powerBlue, 'uint8');
end


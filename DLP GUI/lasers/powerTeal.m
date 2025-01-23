function [app] = powerTeal(app, value)
    tealPowerDec = value;            
    tealPowerHex = dec2hex(255-tealPowerDec, 2);
    powerTealCmd = sscanf(['53 1A 03 02 F', tealPowerHex, '0 50'], '%2X');
    fwrite(app.laser, powerTealCmd, 'uint8');
end
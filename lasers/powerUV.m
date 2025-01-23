function [app] = powerUV(app, value)
    UVPowerDec = value;
    UVPowerHex = dec2hex(255-UVPowerDec, 2);
    powerUV = sscanf(['53 18 03 01 F', UVPowerHex, '0 50'], '%2X');
    fwrite(app.laser, powerUV, 'uint8');
end
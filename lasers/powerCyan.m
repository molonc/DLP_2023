function [app] = powerCyan(app, value)
    cyanPowerDec = value;
    cyanPowerHex = dec2hex(255-cyanPowerDec, 2);
    powerCyanCmd = sscanf(['53 18 03 02 F', cyanPowerHex, '0 50'], '%2X');
    fwrite(app.laser, powerCyanCmd, 'uint8');
end
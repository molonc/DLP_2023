function [app] = powerRed(app, value)
    redPowerDec = value;
    redPowerHex = dec2hex(255-redPowerDec, 2);
    powerRedCmd =  sscanf(['53 18 03 08 F', redPowerHex, '0 50'], '%2X');
    fwrite(app.laser,powerRedCmd,"uint8");
end
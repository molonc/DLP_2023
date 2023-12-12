function[app] = getTemp(app)
    tempCmd = sscanf('53 91 02 50', '%2X');
    fwrite(app.laser, tempCmd, 'uint8');
    tempData = fread(app.laser, 2, 'char');
    first11MSB = tempData(1) * 8 + bitsra(tempData(2), 5);
    app.laserTemp = first11MSB * 0.125;
    disp(['The temperature of the laser control box (oC): ', num2str(app.laserTemp)]);
end
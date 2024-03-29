function [app] = connect2lasers(app)
    laser_serial = serialport(getConfig('LASER_PORT'), 9600);
    fopen(laser_serial)
    laser_serial.DataBits = 8;
    laser_serial.Parity = 'none';
    laser_serial.StopBits = 1;
    laser_serial.FlowControl = 'none';
    configureTerminator(laser_serial, 13);
    
    % Initialize commands
    initCmd1 = sscanf('57 02 FF 50', '%2X');
    initCmd2 = sscanf('57 03 AB 50', '%2X');
    fwrite(laser_serial, initCmd1, 'uint8');
    fwrite(laser_serial, initCmd2, 'uint8');

    app.laserconnectionLabel.FontColor = "#77AC30";
    app.laserconnectionLabel.Text = "Connected";

    app.laser = laser_serial;


    

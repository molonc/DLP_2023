function [app] = enableRed(app)
    redOnCmd = sscanf('4F 7E 50', '%2X'); % hex values for serial communication
    fwrite(app.laser, redOnCmd, 'uint8');
end
  
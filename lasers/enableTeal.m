function [app] = enableTeal(app)
    tealOnCmd = sscanf('4F 3F 50', '%2X'); % hex values for serial communication
    fwrite(app.laser, tealOnCmd, 'uint8');
end
  
function [app] = enableUV(app)
    UVOnCmd = sscanf('4F 77 50', '%2X'); % hex values for serial communication
    fwrite(app.laser, UVOnCmd, 'uint8');
end
  
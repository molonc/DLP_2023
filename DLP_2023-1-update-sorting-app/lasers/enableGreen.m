function [app] = enableGreen(app)
    greenOnCmd = sscanf('4F 7D 50', '%2X'); % hex values for serial communication
    fwrite(app.laser, greenOnCmd, 'uint8');
   
  
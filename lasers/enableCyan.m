function [app] = enableCyan(app)
    cyanOnCmd = sscanf('4F 7B 50', '%2X'); % hex values for serial communication
    fwrite(app.laser, cyanOnCmd, 'uint8');
   
  
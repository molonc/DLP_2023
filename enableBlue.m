function [app] = enableBlue(app)
    blueOnCmd = sscanf('4F 5F 50', '%2X'); % hex values for serial communication
    fwrite(app.laser, blueOnCmd, 'uint8');
  

%Alternative

%enables blue
%fprintf(app.laser,'%s', char([79 95 80]));
%enables green
%fprintf(app.laser,'%s', char([79 125 80]));
%enables cyan
%fprintf(app.laser,'%s', char([79 125 80]));
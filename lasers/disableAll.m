function [app] = disableAll(app)
    allOffCmd = sscanf('4F 7F 50', '%2X');
    fwrite(app.laser, allOffCmd, 'uint8');
end
% moveScopeAbsZ.m
function moveScopeAbsZ (app, position)
    % Convert position from micrometers to microscope units
    %nikonConversion = position / 2.5;

    % Move the Z-axis to an absolute position
    app.ti.ZDrive.MoveAbsolute(position);
    
    % Wait for the device to complete the move
    maxTimeouts = 100;  % Set an appropriate value for your application
    timeoutsResponse = 0;
    app.ti.ZDrive.WaitForDevice(maxTimeouts, timeoutsResponse);
end

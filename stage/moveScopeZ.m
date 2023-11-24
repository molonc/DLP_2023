% moveScopeZ.m
function moveScopeZ (app, distance)
    % Convert distance from micrometers to microscope units
    %nikonConversion = distance / 2.5;

    % Move the Z-axis relative to the current position
    app.ti.ZDrive.MoveRelative(distance);
    % Wait for the device to complete the move
    maxTimeouts = 100;  % Set an appropriate value for your application
    timeoutsResponse = 0;
    app.ti.ZDrive.WaitForDevice(maxTimeouts, timeoutsResponse);
end

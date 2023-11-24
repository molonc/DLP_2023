% moveScopeZ.m
function moveScopeZ (app, distance)
    % Convert distance from micrometers to microscope units
    %nikonConversion = distance / 2.5;

    % Move the Z-axis relative to the current position
    app.ti.ZDrive.MoveRelative(distance);
end

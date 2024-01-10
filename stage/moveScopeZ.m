% moveScopeZ.m
function moveScopeZ (app, distance)
    % Convert distance from micrometers to microscope units
    nikonConversion = (distance / 2.5)*100;
    
    % Move the Z-axis relative to the current position
    app.ti.ZDrive.MoveRelative(nikonConversion);
    % Wait for the device to complete the move
    pause(1);
end

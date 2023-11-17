% moveScopeAbsZ.m
function moveScopeAbsZ (app, position)
    % Convert position from micrometers to microscope units
    nikonConversion = position / 2.5;

    % Move the Z-axis to an absolute position
    app.ti.ZDrive.MoveAbsolute(nikonConversion);
end

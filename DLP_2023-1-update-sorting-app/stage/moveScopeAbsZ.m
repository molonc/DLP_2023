% moveScopeAbsZ.m
function moveScopeAbsZ (app, position) % Not sure how this one works needs to be tested 
    % Convert position from micrometers to microscope units
    nikonConversion = (position / 2.5)*100;

    % Move the Z-axis to an absolute position
    app.ti.ZDrive.MoveAbsolute(nikonConversion); %not sure how to tell it a positio but lets assume this is how 
    
    % Wait for the device to complete the move ** Not sure if this 
    % maxTimeouts = 100;  % Set an appropriate value for your application
    % timeoutsResponse = 0;
    % app.ti.ZDrive.WaitForDevice(maxTimeouts, timeoutsResponse);
end

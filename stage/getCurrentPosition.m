% getCurrentPosition.m
function getCurrentPosition(app)
    writeline(stage, 'WHERE X Y');
    response = readline(app.stage);
    position = sscanf(response, 'A X=%f Y=%f');
    app.StagePosition = position;
    %app.CurrentPositionLabel.Text = sprintf('X=%.2f Y=%.2f Z=%.2f', app.StagePosition);
    
    
    %This is for the scope:

    % Define variables to store positions
    
    newPosition = get(scope.ZDrive.Position, 'DisplayString');
    % Call the GetPosition method
    
    
    app.ScopePosition = (newPosition*2.5)/100; %convert back to normal units?!? (not sure this works) 

end

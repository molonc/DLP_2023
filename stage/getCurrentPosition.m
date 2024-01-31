% getCurrentPosition.m
function getCurrentPosition(app)
    writeline(stage, 'WHERE X Y Z');
    response = readline(app.stage);

    % Extract numerical values from the response using regular expressions
    pattern = '(-?\d+)';  % Match one or more digits, optionally preceded by a minus sign
    matches = regexp(response, pattern, 'tokens');

    % Convert the matched strings to numeric values
    currentPosition = cellfun(@str2double, matches);
    app.StagePosition = currentPosition;
    %app.CurrentPositionLabel.Text = sprintf('X=%.2f Y=%.2f Z=%.2f', app.StagePosition);
    
    
    %This is for the scope:

    % Define variables to store positions
    
    newPosition = get(scope.ZDrive.Position, 'DisplayString');
    % Call the GetPosition method
    
    
    app.ScopePosition = newPosition; %convert back to normal units?!? (not sure this works) 

end

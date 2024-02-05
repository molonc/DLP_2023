% getCurrentPosition.m
function getCurrentPosition(app)
    
    % writeline(app.stage, '/'); % to make sure it is not busy 
    % response = readline(app.stage);  
    % while isequal(response,'N')
    %     writeline(app.stage, '/');
    %     response = readline(app.stage);
    % end
    % response = readline(app.stage);
    writeline(app.stage, 'WHERE X Y Z');
    response = readline(app.stage);
    disp(response);
    
    % Extract numerical values from the response using regular expressions
    position = sscanf(response, ':A %f %f');
    
    disp(position);

    app.StagePosition(1) = position(1);
    app.StagePosition(2) = position(2);


    %app.CurrentPositionLabel.Text = sprintf('X=%.2f Y=%.2f Z=%.2f', app.StagePosition);
    
    
    %This is for the scope:

    % Define variables to store positions
    
    newPosition = get(app.ti.ZDrive.Position, 'DisplayString');
    % Call the GetPosition method
    
    
    app.ScopePosition = newPosition; %convert back to normal units?!? (not sure this works) 

end

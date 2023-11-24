% getCurrentPosition.m
function getCurrentPosition(app)
    fprintf(app.stage, 'W X Y Z');
    response = fscanf(app.stage);
    position = sscanf(response, 'A X=%f Y=%f Z=%f');
    app.StagePosition = position;
    %app.CurrentPositionLabel.Text = sprintf('X=%.2f Y=%.2f Z=%.2f', app.StagePosition);
    %This is for the scope:

    % Define variables to store positions
    xPosition = 0;
    yPosition = 0;
    zPosition = 0;
    piezoPosition = 0;
    
    % Call the GetPosition method
    app.ti.GetPosition(xPosition, yPosition, zPosition, piezoPosition);
    
    app.ScopePosition = zPosition; 

end

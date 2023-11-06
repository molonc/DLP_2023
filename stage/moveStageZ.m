% moveStageZ.m
function moveStageZ(app, distance)
    command = sprintf('R Z=%.2f', distance);
    fprintf(app.stage, command);
    % Update the position and display it
    app.StagePosition(3) = app.StagePosition(3) + distance;
    
end
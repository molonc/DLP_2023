% moveStageY.m
function moveStageY(app, distance)
    command = sprintf('R Y=%.2f', distance);
    writeline(app.stage, command);
    % Update the position and display it
    app.StagePosition(2) = app.StagePosition(2) + distance;
    
end
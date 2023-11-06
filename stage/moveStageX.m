% moveStageX.m
function moveStageX(app, distance)
    command = sprintf('R X=%.2f', distance); % I think it needs to be done like this 
    fprintf(app.stage, command);
    % Update the position and display it
    app.StagePosition(1) = app.StagePosition(1) + distance;
    
end

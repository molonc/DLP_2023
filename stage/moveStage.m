% moveStage.m
function moveStage(app,corner)
    command = sprintf('M X=%.2f Y=%.2f Z=%.2f', corner(1), corner(2), corner(3));
    fprintf(app.stage, command);
    waitBeforeMoving(app); %this should wait the correct amount of time 
end
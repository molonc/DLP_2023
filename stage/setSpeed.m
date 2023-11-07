% setSpeed
function setSpeed(app)
    command = sprintf('S X=%.2f Y=%.2f Z=%.2f', app.stageSpeed,app.stageSpeed,app.stageSpeed);
    fprintf(app.stage, command);    
end
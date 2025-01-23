% setSpeed
function setSpeed(app)
    command = sprintf('S X=%.2f Y=%.2f', app.stageSpeed,app.stageSpeed,app.stageSpeed);
    writeline(app.stage, command);    
end
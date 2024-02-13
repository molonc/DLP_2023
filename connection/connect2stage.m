% connect2stage.m
function connect2stage(app,comPort)
    stage = serialport(comPort, 115200);
    configureTerminator(stage, "CR");  % Set Carriage Return as the terminator
    timeoutDuration = 10;  % Set timeout duration in seconds
    stage.Timeout = timeoutDuration;
    app.stage = stage;
    % response = readline(app.stage); % dont need 
    app.stageconnectionLabel.FontColor = "#77AC30";
    app.stageconnectionLabel.Text = "Connected";
end

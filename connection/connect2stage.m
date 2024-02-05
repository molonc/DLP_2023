% connect2stage.m
function connect2stage(app,comPort)
    app.stage = serialport(comPort, 115200);
    configureTerminator(app.stage, "CR");  % Set Carriage Return as the terminator
    timeoutDuration = 10;  % Set timeout duration in seconds
    app.stage.Timeout = timeoutDuration;
    % response = readline(app.stage); % dont need 
    app.stageconnectionLabel.FontColor = "#77AC30";
    app.stageconnectionLabel.Text = "Connected";
end

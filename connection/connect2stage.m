% connect2stage.m
function connect2stage(app,comPort)
    %try
    app.stage = serialport(comPort, 115200);
    configureTerminator(app.stage, "CR");  % Set Carriage Return as the terminator
    timeoutDuration = 10;  % Set timeout duration in seconds
    app.stage.Timeout = timeoutDuration;
    app.stageconnectionLabel.FontColor = "#77AC30";
    app.stageconnectionLabel.Text = "Connected";
    % catch
    %     disp(error);
    %     app.stageconnectionLabel.FontColor = 'r';
    %     app.stageconnectionLabel.Text = "Connection Failed";
    % end
end

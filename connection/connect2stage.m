% connect2stage.m
function connect2stage(app,comPort)
    try
        app.stage = serialport(comPort); % this needs to be updated to include the correct com ports from getconfig
        set(app.stage, 'BaudRate', 9600, 'DataBits', 8, 'StopBits', 1, 'Parity', 'none');
        fopen(app.stage);
        app.stageconnectionLabel.FontColor = "#77AC30";
        app.stageconnectionLabel.Text = "Connected";
    catch
        app.stageconnectionLabel.FontColor = 'r';
        app.stageconnectionLabel.Text = "Connection Failed";
    end
end

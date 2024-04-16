% checkconnectStatus.m
function checkconnectionStatus(app)
    if app.cameraconnectionLabel.Text == "Connected" && app.laserconnectionLabel.Text == "Connected" && app.stageconnectionLabel.Text == "Connected" && app.MicroscopecoonectionLabel.Text == "Connected"
        app.systemreadyStatus.FontColor = "#77AC30";
        app.systemreadyStatus.Text = "Instruments Connected waiting for Tile Selection"; 
    end
    if app.tile
end

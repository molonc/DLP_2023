function [app] = connect2camera(app)
    app.vidobj = videoinput('pointgrey', 1,'F7_Mono16_1920x1200_Mode0');
    app.cameraconnectionLabel.FontColor = "#77AC30";
    app.cameraconnectionLabel.Text = "Connected";
            
end 
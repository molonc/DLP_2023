function [app] = connect2camera(app)
    vid = videoinput('pointgrey', 1);
    % Set up video object properties (adjust as needed)
    vid.FramesPerTrigger = Inf;
    vid.ReturnedColorspace = 'rgb';
    app.vidobj = vid;
    app.cameraconnectionLabel.FontColor = "#77AC30";
    app.cameraconnectionLabel.Text = "Connected";
            
end 
function disconnectFromCamera(app)
    try
        if isfield(app, 'vidobj') && isvalid(app.vidobj)
            stop(app.vidobj); % Stop the video input if it's running
            delete(app.vidobj); % Delete the video input object
            clear app.vidobj;   % Clear the app's vidobj property
            app.cameraconnectionLabel.FontColor = 'r';
            app.cameraconnectionLabel.Text = "Not Connected"; % Set disconnected text
        end
    catch
        app.cameraconnectionLabel.FontColor = 'r';
        app.cameraconnectionLabel.Text = "Disconnection Failed";
    end
end

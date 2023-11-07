function disconnectFromStage(app)
    try
        if ~isempty(app.stage) && isvalid(app.stage)
            fclose(app.stage); % Close the serial port
            delete(app.stage); % Delete the serial port object
            clear app.stage;   % Clear the app's stage property
            app.stageconnectionLabel.FontColor = 'r';
            app.stageconnectionLabel.Text = "Not Connected";
        else
            app.stageconnectionLabel.FontColor = 'r';
            app.stageconnectionLabel.Text = "No Active Connection"; % No active connection to disconnect from
        end
    catch
        app.stageconnectionLabel.FontColor = 'r';
        app.stageconnectionLabel.Text = "Disconnection Failed";
    end
end

function disconnectFromLaser(app)
     try
        if ~isempty(app.laser) && isvalid(app.laser)
            fclose(app.laser);
            delete(app.laser);
            clear app.laser
            app.laserconnectionLabel.FontColor = 'r';
            app.laserconnectionLabel.Text = "Not Connection";
        else
            app.laserconnectionLabel.FontColor = 'r';
            app.laserconnectionLabel.Text = "No Active Connection"; % No active connection to disconnect from
        end
    catch
        app.laserconnectionLabel.FontColor = 'r';
        app.laserconnectionLabel.Text = "Disconnection Failed";
    end
end




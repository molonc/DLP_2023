function disconnectFromeScope(app)
    try
        % Disconnect from the microscope
        app.ti.Disconnect();
        
        % Release the COM object
        release(app.ti);
        
        app.MicroscopeConnectionLabel.FontColor = 'r';
        app.MicroscopeConnectionLabel.Text = "Not Connected";
    catch
        warndlg('Error disconnecting from the microscope.');
    end
end
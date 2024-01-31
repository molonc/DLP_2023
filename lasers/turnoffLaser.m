function turnoffLaser(app, wavelength)
    
    switch wavelength 
        case 440
            app.OFFButtonBlue.Text = "OFF";
            % app.BLUEEditField.Value = 0; % cant set the Editfield to zero since we are using it as the power setting
            % powerBlue(app, 0); % need to figure out if disable works to turn the laser off
            disableAll(app);
        case 470
            app.OFFButtonCyan.Text = "OFF";           
            % app.CYANEditField.Value = 0;
            % powerCyan(app,0);
            disableAll(app);
        case 550            
            app.OFFButtonGreen.Text = "OFF";           
            % app.GREENEditField.Value = 0;
            % powerGreen(app,0);
            disableAll(app);
        case 510
            app.OFFButtonTeal.Text = "OFF";
            % app.TEALEditField.Value = 0;
            % powerTeal(app, 0);
            disableAll(app);
        case 395 % UV
            app.OFFButtonUV.Text = "OFF";
            % app.UVEditField.Value = 0;
            % powerUV(app, 0);
            disableAll(app);
        case 640
            app.OFFButtonRed.Text = "OFF";
            % app.REDEditField.Value = 0;
            % powerRed(app,0);
            disableAll(app);
    end
end

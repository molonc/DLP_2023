function turnoffLaser(app, wavelength)
    switch wavelength 
        case 440
            app.BLUEEditField.Value = 0;
            app.checkBlue = 0;
            app.OFFButtonBlue.Text = "OFF";           
        case 470
            app.checkCyan = 0;
            app.OFFButtonCyan.Text = "OFF";           
            app.CyanEditField.Value = 0;
        case 550
            app.checkGreen = 0;
            app.OFFButtonGreen.Text = "OFF";           
            app.GREENEditField.Value = 0;
    end
end

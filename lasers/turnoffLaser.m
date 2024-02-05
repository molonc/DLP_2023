function turnoffLaser(app, wavelength) 
    switch wavelength 
        case 440
            app.OFFButtonBlue.Text = "OFF";
            disableAll(app);
        case 470
            app.OFFButtonCyan.Text = "OFF";           
            disableAll(app);
        case 550
            app.OFFButtonGreen.Text = "OFF";           
            disableAll(app);
        case 510
            app.OFFButtonTeal.Text = "OFF";
            disableAll(app);
        case 395 % UV
            app.OFFButtonUV.Text = "OFF";
            disableAll(app);
        case 640
            app.OFFButtonRed.Text = "OFF";
            disableAll(app);
    end
end

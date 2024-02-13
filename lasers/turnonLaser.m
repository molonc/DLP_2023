function turnonLaser(app, wavelength)
    switch wavelength 
        case 440
            enableBlue(app);
            powerBlue(app, app.BLUEEditField.Value);
        case 470
            enableCyan(app);
            powerCyan(app, app.CYANEditField.Value);
        case 550
            enableGreen(app);
            powerGreen(app, app.GREENEditField.Value);
        case 510
            enableTeal(app);
            powerTeal(app, app.TEALEditField.Value);
        case 395 % UV
            enableUV(app);
            powerUV(app, app.UVEditField.Value);
        case 640
            enableRed(app);
            powerRed(app, app.REDEditField.Value);
    end
end



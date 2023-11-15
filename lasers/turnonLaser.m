function turnonLaser(app, wavelength)
    switch wavelength 
        case 440
            enableBlue(app)
            powerBlue(app, app.BLUEEditField.Value)
        case 470
            enableCyan(app)
            powerCyan(app, app.UVEditField.Value)
        case 550
            enableGreen(app)
            powerGreen(app, app.GREENEditField.Value)
    end
end



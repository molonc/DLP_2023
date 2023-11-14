function turnonLaser(wavelength)
    switch wavelength 
        case 440
            enableBlue(app)
            powerBlue(app, app.BLUEEditField.Value)
        case 470
            enableGreen(app)
            powerGreen(app, app.GREENEditField.Value)
        case 550
            enableUV(app)
            powerUV(app, app.UVEditField.Value)
    end
end



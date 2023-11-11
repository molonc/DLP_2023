lasers = {'blue', 'green', 'UV'};

if app.checkBlue == 1
    turnOnLaser(app, 440)
elseif app.checkGreen == 1
    turnOnLaser(app, 550)
elseif app.checkCyan == 1
    turnOnLaser(app,470)
end

function [app] = turnOnLaser(app, wavelength)
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



function openShutter(app)
    if (app.ti.AuxShutter.IsMounted == StatusTrue)
        app.ti.auxshutter.open()
    end
    if (app.ti.DiaShutter.IsMounted == StatusTrue)
        app.ti.DiaShutter.open()
    end
    if (app.ti.EpiShutter.IsMounted == StatusTrue)
        app.ti.EpiShutter.open()
    end

end


    
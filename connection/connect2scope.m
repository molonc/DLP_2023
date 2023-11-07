function [app] = connect2scope(app)
    app.ti = actxserver('Nikon.TiScope.NikonTI');
    app.MicroscopecoonectionLabel.FontColor = "#77AC30";
    app.MicroscopecoonectionLabel.Text = "Connected";
end
function [app] = connect2scope(app)
    scope = actxserver('Nikon.TiScope.NikonTI');
    Connect(scope,1);
    app.ti = scope; 
    %more code for furthe connections and initialization is probably
    %required idk though 
    app.MicroscopecoonectionLabel.FontColor = "#77AC30";
    app.MicroscopecoonectionLabel.Text = "Connected";
end
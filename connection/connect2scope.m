function connect2scope(app)
    % Create a Nikon Ti object
    scope = actxserver('Nikon.TiScope.NikonTi');
    pause(.5);
    scope.FilterBlockCassette1.Forward() % initializes 
    pause(.5);
    scope.FilterBlockCassette1.Forward() % moves to psition 2
    pause(.5);
    scope.FilterBlockCassette1.Forward() % Moves to Position 3 which is mcherry 
    % scope.FilterBlockCassette1.Forward()
    app.ti = scope;
    app.MicroscopecoonectionLabel.FontColor = "#77AC30";
    app.MicroscopecoonectionLabel.Text = "Connected";
end
function connect2scope(app)
    % Create a Nikon Ti object
    scope = actxserver('Nikon.TiScope.NikonTi');
    % Moves to Position 3 which is mcherry 
    % scope.FilterBlockCassette1.Forward()
    app.ti = scope;
    current_position_str = get(app.ti.FilterBlockCassette1.Position, 'DisplayString');
    current_position = str2double(current_position_str);
    app.filtercubeposition = current_position;
    moveFilterCube(app,3);
    moveFilterCube(app,3);
    app.MicroscopecoonectionLabel.FontColor = "#77AC30";
    app.MicroscopecoonectionLabel.Text = "Connected";
end
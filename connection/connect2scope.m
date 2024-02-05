function connect2scope(app)
    % Create a Nikon Ti object
    scope = actxserver('Nikon.TiScope.NikonTi');
    pause(2);
    scope.FilterBlockCassette1.Forward() % initializes 
    scope.FilterBlockCassette1.Forward() % moves to psition 2
    scope.FilterBlockCassette1.Forward() % Moves to Position 3 which is mcherry 
    % scope.FilterBlockCassette1.Forward()
    app.ti = scope;
    app.MicroscopecoonectionLabel.FontColor = "#77AC30";
    app.MicroscopecoonectionLabel.Text = "Connected";
    % Check if the microscope is connected
    % if scope.IsConnected
    %     app.ti = scope; % Store the microscope object in the app
    %     app.MicroscopeConnectionLabel.FontColor = "#77AC30";
    %     app.MicroscopeConnectionLabel.Text = "Connected";
    % else
    %     disp('Microscope connection failed.');
    % end
end
function connect2scope(app)
    % Create a Nikon Ti object
    scope = actxserver('Nikon.TiScope.NikonTi');
    pause(2);
    app.ti = scope;
    app.MicroscopeConnectionLabel.FontColor = "#77AC30";
    app.MicroscopeConnectionLabel.Text = "Connected";
    % Check if the microscope is connected
    % if scope.IsConnected
    %     app.ti = scope; % Store the microscope object in the app
    %     app.MicroscopeConnectionLabel.FontColor = "#77AC30";
    %     app.MicroscopeConnectionLabel.Text = "Connected";
    % else
    %     disp('Microscope connection failed.');
    % end
end
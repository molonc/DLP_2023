function [app] = disconnectFromeScope(app)
try
    delete(app.ti);
    app.MicroscopecoonectionLabel.FontColor = 'r';
    app.MicroscopecoonectionLabel.Text = "Not Connected";
catch
    warndlg('Scope was not connected.');
end
end
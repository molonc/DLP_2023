%Checking the corners selection 
function cornerselectionStatus(app)
    if ~isequal(app.topleft, [0, 0, 0]) && ~isequal(app.topright, [0, 0, 0]) && ~isequal(app.bottomleft, [0, 0, 0])
        % System is ready
        app.systemreadyStatus.FontColor = '#77AC30';
        app.systemreadyStatus.Text = 'System is Ready to Run';
    end
end
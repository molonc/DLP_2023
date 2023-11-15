%Checking the corners selection 
function cornerselectionStatus(app)
    if app.topleft ~= [0,0,0] && app.topright ~= [0,0,0] && app.bottomleft ~= [0,0,0]
        app.systemreadyStatus.FontColor = "#77AC30";
        app.systemreadyStatus.Text = "System is Ready to Run";
    end
end
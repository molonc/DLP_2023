function waitBeforeMoving(app)
    %waits until the stage is no longer moving 
    fprintf(app.stage, '/'); % this will retrun the status B meaning busy N meaning no motor runnning
    response = fscanf(app.stage);
    pause(abs(app.topleft(1)-app.topright(1))/(3000*23)); % I think this is the wait time for xstep if that makes sense
    if isequal(response,'N') % hoping that this doesnt mess anything up 
        return; 
    else
        waitBeforeMoving(app);
    end
end

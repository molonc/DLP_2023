% getCurrentPosition.m
function getCurrentPosition(app)
    fprintf(app.stage, 'W X Y Z');
    response = fscanf(app.stage);
    position = sscanf(response, 'A X=%f Y=%f Z=%f');
    app.StagePosition = position;
    %app.CurrentPositionLabel.Text = sprintf('X=%.2f Y=%.2f Z=%.2f', app.StagePosition);
end

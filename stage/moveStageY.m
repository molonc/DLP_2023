% moveStageY.m
function moveStageY(app, distance)
    command = sprintf('R X Y=%.2f Z', distance);
    writeline(app.stage, command);
    response = readline(stage); % sneds back :A when complete

    writeline(stage, '/');
    response = readline(stage);  
    while isequal(response,'N')
        writeline(stage, '/');
        response = readline(stage);
    end
end
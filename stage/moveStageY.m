% moveStageY.m
function moveStageY(app, distance)
    command = sprintf('R X Y=%.2f Z', distance);
    writeline(app.stage, command);
    [~] = readline(app.stage); % sends back :A when complete
    
    writeline(app.stage, '/');
    response = readline(app.stage);  
    while isequal(response,'N')
        writeline(app.stage, '/');
        response = readline(app.stage);
    end
end
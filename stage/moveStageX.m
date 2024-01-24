% moveStageX.m
function moveStageX(app, distance)
    command = sprintf('R X=%.2f Y Z', distance); % I think it needs to be done like this 
    writeline(app.stage, command);
    response = readline(stage); % sneds back :A when complete

    writeline(stage, '/');
    response = readline(stage);  
    while isequal(response,'N')
        writeline(stage, '/');
        response = readline(stage);
    end
    
end

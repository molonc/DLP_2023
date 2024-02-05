% moveStageX.m
function moveStageX(app, distance)
    command = sprintf('R X=%.2f Y Z', distance); % I think it needs to be done like this 
    writeline(app.stage, command);
    response = readline(app.stage); % sends back :A when complete

    writeline(app.stage, '/');
    response = readline(app.stage);  
    while isequal(response,'N')
        writeline(app.stage, '/');
        response = readline(app.stage);
    end
    
end

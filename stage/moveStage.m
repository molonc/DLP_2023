% moveStage.m
function moveStage(app,corner)
    command = sprintf('M X=%.2f Y=%.2f', corner(1), corner(2));
    writeline(app.stage, command);
    [~] = readline(app.stage); % sends back :A when complete

    writeline(app.stage, '/');
    response = readline(app.stage);  
    while isequal(response,'N')
        writeline(app.stage, '/');
        response = readline(app.stage);
    end
    %waitBeforeMoving(app); %this should wait the correct amount of time 
end
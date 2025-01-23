% getCurrentPosition.m
function getCurrentPosition(app)

    validPosition = false;

    while ~validPosition
        % Send a command and read the response
        writeline(app.stage, 'WHERE X Y Z');
        response = readline(app.stage);
        response = strtrim(response);
        % display(response);
    
        % Extract numerical values from the response using sscanf
        position = sscanf(response, ':A %f %f');
    
        % Check if a valid position is obtained
        if numel(position) == 2
            validPosition = true;
            % disp('Valid position obtained:');
            % disp(position(1));
            % disp(position(2));
        else
            disp('Invalid position. Retrying...');
        end
    end% Send a
        
    app.StagePosition(1) = position(1);
    app.StagePosition(2) = position(2);
      
    
    %This is for the scope:

    % Define variables to store positions
    
    newPosition = get(app.ti.ZDrive.Position, 'DisplayString');
    % Call the GetPosition method
    microscopePosition = str2double(strtok(newPosition, ' um'));
    
    app.ScopePosition = microscopePosition; %convert back to normal units?!? (not sure this works) 

end

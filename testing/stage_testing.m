% Create a serial port object
stage = serialport('COM4', 115200);
configureTerminator(stage, "CR");  % Set Carriage Return as the terminator
timeoutDuration = 10;  % Set timeout duration in seconds
stage.Timeout = timeoutDuration;
% readline(stage)


validPosition = false;

while ~validPosition
    % Send a command and read the response
    writeline(stage, 'WHERE X Y Z');
    response = readline(stage);
    display(response);

    % Extract numerical values from the response using sscanf
    position = sscanf(response, ':A %f %f');

    % Check if a valid position is obtained
    if numel(position) == 2
        validPosition = true;
        disp('Valid position obtained:');
        disp(position(1));
        disp(position(2));
    else
        disp('Invalid position. Retrying...');
    end

    disp(1);
end% Send a command and read the response

% Extract numerical values from the response using regular expressions
% pattern = '(-?\d+)';  % Match one or more digits, optionally preceded by a minus sign
% matches = regexp(response, pattern, 'tokens');
% 
% % Convert the matched strings to numeric values
% currentPosition = cellfun(@str2double, matches);
% 
% 
% position = sscanf(currentPosition, '%f %f');
% disp(position);

delete(stage)
clear stage



% % Testing the Stage 
% stage = serialport('COM4', 115200); 
% 
% % Send command to get X and Y positions
% fprintf(stage, 'W X Y');
% 
% % Introduce a delay to allow the stage device to process the command
% pause(1);
% 
% % Read a fixed number of characters
% response = fscanf(stage);
% position = sscanf(response, 'A X=%f Y=%f');
% 
% % Display the response
% disp(position);
% 
% % Disconnect
% delete(stage);
% clear stage;



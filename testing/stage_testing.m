% Create a serial port object
stage = serialport('COM4', 115200);
configureTerminator(stage, "CR");  % Set Carriage Return as the terminator
timeoutDuration = 10;  % Set timeout duration in seconds
stage.Timeout = timeoutDuration;

% Send a command and read the response
try
    writeline(stage, 'WHERE X Y Z');  % Example MOVE command
    response = readline(stage);
    disp(response);
    writeline(stage, 'MOVE X=0 Y=0')
    response = readline(stage);
    disp(response); 
catch exception
    disp(['Error: ' exception.message]);
end

% Close the serial port
delete(stage);
clear stage;



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



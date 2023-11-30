% this is aquisition.m 
function aquisition (app)
   % Assuming you have a 24x36 matrix named 'inputMatrix'
rows = 24;
cols = 36;

% d is te progress bar that will pop up during acquisition
d = uiprogressdlg(fig,'Single Cell Acquisition Progress','Please Wait',...
        'Message','Starting Acquisition');
pause(2)


%this is just the loop format for moving along the matrix in a snaking
%pattern

for i = 1:rows
    % For odd rows, move left to right
    d.Message = "Acquiring Data Current Row: " + i;
    if mod(i, 2) ~= 0
        for j = 1:cols
           if app.PauseAcquisition
                % Update the progress dialog message
                d.Message = "Acquisition Paused at Row: " + i;
                 
                while app.PauseAcquisition
                    pause(3); % Adjust the pause duration as needed
                end
                d.Message = "Acquisition Resuming at Row: " + i; 
            end
            if app.checkBlue == 1 %if it's checked, the blue laser is turned on
                turnonLaser(app, 440) %enables laser and sets its power
            end
            calcdisplacement(app, i, j);
            turnoffLaser(app, 440)
            

            %imaging 
            if app.checkCyan == 1
                turnonLaser(app, 470)
                imaging(app,i,j,470);
                turnoffLaser(app, 470)
            end
            if app.checkGreen == 1 
                turnonLaser(app, 550)
                imaging(app,i,j,550); 
                turnoffLaser(app, 550); 
            end                  
        end
    else
        % For even rows, move right to left
        for j = cols:-1:1
            if app.PauseAcquisition
                % Update the progress dialog message
                d.Message = "Acquisition Paused at Row: " + i;
                 
                while app.PauseAcquisition
                    pause(3); % Adjust the pause duration as needed
                end
                d.Message = "Acquisition Resuming at Row: " + i; 
            end
            if app.checkBlue == 1 %if it's checked, the blue laser is turned on
                turnonLaser(app, 440) %enables laser and sets its power
            end
            calcdisplacement(app, i, j);
            turnoffLaser(app, 440)
            
            %imaging 
            if app.checkCyan == 1
                turnonLaser(app, 470)
                imaging(app,i,j,470);
                turnoffLaser(app, 470)
            end
            if app.checkGreen == 1 
                turnonLaser(app, 550)
                imaging(app,i,j,550); 
                turnoffLaser(app, 550); 
            end  
        end
    end
    d.Value = i/24;
end
d.Value = 1; 
d.Message = "Acquisition Completed"; 
pause(2);
close(d)



end
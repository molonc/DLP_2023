% this is aquisition.m 
function aquisition (app)
   % Assuming you have a 24x36 matrix named 'inputMatrix'
rows = 24;
cols = 36;

% d is te progress bar that will pop up during acquisition
d = uiprogressdlg(fig,'Single Cell Acquisition Progress','Please Wait',...
        'Message','Starting Acquisition);
pause(.5)


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
            %pause(waitBeforeMoving(app)) need to figure out how long to
            %wait 

            %imaging 
            if app.checkCyan == 1
                turnonLaser(app, 470)
            end
            if app.checkGreen == 1 
                turnonLaser(app, 550)
            end
            imaging(app,i,j);    
            turnoffLaser(app, 470) %can comment out if only want to image with green
            turnoffLaser(app, 550)
        end
    else
        % For even rows, move right to left
        for j = cols:-1:1
            if app.checkBlue == 1 %if it's checked, the blue laser is turned on
                turnonLaser(app, 440) %enables laser and sets its power
            end
            calcdisplacement(app, i, j);
            turnoffLaser(app, 440)
            %pause(waitBeforeMoving(app)) need to figure out how long to
            %wait 

            %imaging 
            if app.checkCyan == 1
                turnonLaser(app, 470)
            end
            if app.checkGreen == 1 
                turnonLaser(app, 550)
            end
            imaging(app,i,j);    
            turnoffLaser(app, 470) %can comment out if only want to image with green
            turnoffLaser(app, 550)
        end
    end
    d.value = i/24;
end
d.Value = 1; 
d.Message = "Acquisition Completed"; 
pause(1);
close(d)



end

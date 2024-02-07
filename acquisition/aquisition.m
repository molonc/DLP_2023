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
                
                % Move to position
    
                calcdisplacement(app, i, j);            
                
    
                %imaging 
    
                if app.CheckCyan.Value == 1
                    changeFilterCube(app, app.CyanFC);
                    turnonLaser(app, 470)
                    imaging(app,i,j,470);
                    turnoffLaser(app, 470)
                end
                if app.CheckGreen.Value == 1 
                    changeFilterCube(app, app.GreenFC);
                    turnonLaser(app, 550)
                    imaging(app,i,j,550); 
                    turnoffLaser(app, 550); 
                end   
                if app.CheckRed.Value
                    changeFilterCube(app, app.RedFC);
                    turnonLaser(app,640);
                    imaging(app,i,j,640);
                    turnoffLaser(app)
                end
                if app.CheckTeal.Value
                    changeFilterCube(app, app.TealFC);
                   turnonLaser(app,510);
                   imaging(app,i,j,510);
                   turnoffLaser(app,510);
                end
                if app.CheckBlue.Value
                    changeFilterCube(app, app.BlueFC);
                    turnonLaser(app, 440);
                    imaging(app,i,j,440);
                    turnoffLaser(app,440);
                end
                if app.CheckUV.Value
                    changeFilterCube(app, app.UVFC);
                    turnonLaser(app, 395);
                    imaging(app,i,j,395);
                    turnoffLaser(app,395);
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
                
                % Move to position
                calcdisplacement(app, i, j);
    
                
                %imaging 
    
                if app.CheckCyan.Value == 1
                    changeFilterCube(app, app.CyanFC);
                    turnonLaser(app, 470)
                    imaging(app,i,j,470);
                    turnoffLaser(app, 470)
                end
                if app.CheckGreen.Value == 1 
                    changeFilterCube(app, app.GreenFC);
                    turnonLaser(app, 550)
                    imaging(app,i,j,550); 
                    turnoffLaser(app, 550); 
                end   
                if app.CheckRed.Value
                    changeFilterCube(app, app.RedFC);
                    turnonLaser(app,640);
                    imaging(app,i,j,640);
                    turnoffLaser(app)
                end
                if app.CheckTeal.Value
                    changeFilterCube(app, app.TealFC);
                   turnonLaser(app,510);
                   imaging(app,i,j,510);
                   turnoffLaser(app,510);
                end
                if app.CheckBlue.Value
                    changeFilterCube(app, app.BlueFC);
                    turnonLaser(app, 440);
                    imaging(app,i,j,440);
                    turnoffLaser(app,440);
                end
                if app.CheckUV.Value
                    changeFilterCube(app, app.UVFC);
                    turnonLaser(app, 395);
                    imaging(app,i,j,395);
                    turnoffLaser(app,395);
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
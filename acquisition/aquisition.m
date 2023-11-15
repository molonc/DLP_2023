% this is aquisition.m 
function aquisition (app)
   % Assuming you have a 24x36 matrix named 'inputMatrix'
rows = 24;
cols = 36;



%this is just the loop format for moving along the matrix in a snaking
%pattern

for i = 1:rows
    % For odd rows, move left to right
    if mod(i, 2) ~= 0
        for j = 1:cols
            calcdisplacement(app, i, j);
            %pause(waitBeforeMoving(app)) need to figure out how long to
            %wait 

            %turn the correct laser on 

            %imaging 
            imaging(app,i,j); 
        end
    else
        % For even rows, move right to left
        for j = cols:-1:1
            calcdisplacement(app, i, j);
            %pause(waitBeforeMoving(app)) need to figure out how long to
            %wait 

            %turn the correct laser on 

            %imaging 
            imaging(app,i,j); 
        end
    end
end




end

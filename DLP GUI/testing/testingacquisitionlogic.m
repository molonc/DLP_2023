
% i = 35;
% j = 0;

topleft = [-1,0];
topright = [0,1];
bottomleft = [0,-1];
tl = 0;
tr = -2/3;
bl = 0;


xstep = (topright(1) - topleft(1))/23; % i think it should be one less since we are starting at topleft 
% step size as you move down to the next tile in y
ystep = (bottomleft(2)-topleft(2))/35; 
%how y changes as it moves down along x 
ydispinx = (topright(2) - topleft(2))/23;
% hgow x changes as it moves along y 
xdispiny = (bottomleft(1) - topleft(1))/35; 

%this is finding the next tiles position based on a i and j
%cooridinate 

% imagingtile(1) = topleft(1) + j*xstep + i*xdispiny;
% imagingtile(2) = topleft(2) + i*ystep + j*ydispinx;

% disp(imagingtile);

% Initialize the matrix to store the positions
positions = zeros(36, 24, 2);

% Iterate through each tile and calculate its position
for i = 1:36
    for j = 1:24
        % Calculate the position of the current tile
        x_position =topleft(1) + (j-1)*xstep + (i-1)*xdispiny;
        y_position = topleft(2) + (i-1)*ystep + (j-1)*ydispinx;
        
        % Store the position in the matrix
        positions(i, j, :) = [x_position, y_position];
    end
end

% Display the matrix of positions
disp(positions);

zdispinx = (tr-tl)/23;
zdispiny = (bl-tl)/35;

zpos = tl+23*zdispinx+35*zdispiny;
disp(zpos);
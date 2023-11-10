% 3d geometry 

function calcdisplacement(app, i, j) % i is rows and j is collumns 

    %i and j should start from 0 if the topleft is in the 0,0 postion of
    %the 24x36 matrix 



    % step size to get to next tile along x 
    xstep = (app.topright(1) - app.topleft(1))/23; % i think it should be one less since we are starting at topleft 
    % step size as you move down to the next tile in y
    ystep = (app.bottomleft(2)-app.topleft(2))/35; 
    %how y changes as it moves down along x 
    ydispinx = (app.topright(2) - app.topleft(2))/23;
    % hgow x changes as it moves along y 
    xdispiny = (app.bottomleft(1) - app.topright(1))/35; 

    % how z displaces as we move down the x and y axis 
    zdispinx = (app.topright(3) - app.topleft(3))/23;

    zdispiny = (app.bottomleft(3) - app.topleft(3))/35; 

    
    %this is finding the next tiles position based on a i and j
    %cooridinate 
    app.imagingtile(1) = app.topleft(1) + i*xstep + j*xdispiny;
    app.imagingtile(2) = app.topleft(2) + j*ystep + i*ydispinx;
    app.imagingtile(3) = app.topleft(3) + i*zdispinx + j*zdispiny; 



    %this is for if we want calc postion to move to the next tile as well 
    %moveStage(app, app.imagingtile);


   


    
end 
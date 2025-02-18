% 3d geometry 

function calcdisplacement(app, i, j) % i is rows and j is collumns 

    %i and j should start from 0 if the topleft is in the 0,0 postion of
    %the 36x24 matrix 
    
    %this is to zero the postions 
    i = i-1;
    j= j-1;
    
    % step size to get to next tile along x 
    xstep = (app.topright(1) - app.topleft(1))/23; % i think it should be one less since we are starting at topleft 
    % step size as you move down to the next tile in y
    ystep = (app.bottomleft(2)-app.topleft(2))/35; 
    %how y changes as it moves down along x 
    ydispinx = (app.topright(2) - app.topleft(2))/23;
    % hgow x changes as it moves along y 
    xdispiny = (app.bottomleft(1) - app.topleft(1))/35; 
    
    %this is finding the next tiles position based on a i and j
    %cooridinate 
    app.imagingtile(1) = app.topleft(1) + j*xstep + i*xdispiny;
    app.imagingtile(2) = app.topleft(2) + i*ystep + j*ydispinx;
    
    moveStage(app, app.imagingtile);
    %this is for the scope
    zdispinx = (app.tr_scope - app.tl_scope)/23;
    zdispiny = (app.bl_scope - app.tl_scope)/35; 
    
    scope_postion = app.tl_scope + zdispinx*j + zdispiny*i;
    
    %this is for if we want calc postion to move to the next tile as well 
    moveScopeAbsZ(app,scope_postion); 
    
    pause(0.1); % it should wait anyways but just to give it time


end 
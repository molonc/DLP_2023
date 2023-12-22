try
    % Try to create an instance of the Nikon TiScope
    scope = actxserver('Nikon.TiScope.NikonTi');
    
    % Get the current position of ZDrive
    currentPosition = get(scope.ZDrive.Position, 'DisplayString');

    distanceToMove = input('Enter the distance to move (in micrometers): ');
    % Move ZDrive 50 micrometers up
    distanceToMove = (distanceToMove/2.5)*100;

    scope.ZDrive.MoveRelative(distanceToMove);

    % Pause for a moment to allow the ZDrive to move
    pause(2);

    % Get the new position of ZDrive
    newPosition = get(scope.ZDrive.Position, 'DisplayString');
    
    % Display the new position
    disp(['ZDrive moved from ' num2str(currentPosition) ' to ' num2str(newPosition) ' micrometers.']);
    get(scope.AuxShutter.IsMounted,'DisplayString')
    if get(scope.AuxShutter.IsMounted,'DisplayString')
        scope.AuxShutter.Open();
    end
    get(scope.DiaShutter.IsMounted,'DisplayString')
    % Check and open DiaShutter if mounted
    if get(scope.DiaShutter.IsMounted,'DisplayString')
        scope.DiaShutter.Open();
    end
    %get(scope.EpiShutter.IsMounted,'DisplayString') returns device
    %unavailable 
    % Check and open EpiShutter if mounted
    if get(scope.EpiShutter.IsMounted,'DisplayString')
        scope.EpiShutter.Open();
    end

    % Release the ActiveX server
    release(scope);
catch exception
    % Display error message
    disp(['Error: ' exception.message]);
    release(scope);
end

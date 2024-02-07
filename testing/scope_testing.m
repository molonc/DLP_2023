
% Try to create an instance of the Nikon TiScope
scope = actxserver('Nikon.TiScope.NikonTi');

% get(scope); %not sure this will work but we can try to see the list of propeties 
% Get the current position of ZDrive
currentPosition = get(scope.ZDrive.Position, 'DisplayString');
disp(currentPosition);

scope.LightPathDrive.ChangeLightPath(2); % not sure if this is how to do it
% scope.LightPathDrive.ChangeLightPath("L100");
% this could be our issue with the laser not showing up needs to be set to mcherry
filterblock = get(scope.FilterBlockCassette1.Position, 'DisplayString'); 
disp(filterblock);
% 

% scope.FilterBlockCassette1.Forward()




    


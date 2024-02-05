
% Try to create an instance of the Nikon TiScope
scope = actxserver('Nikon.TiScope.NikonTi');

% get(scope); %not sure this will work but we can try to see the list of propeties 
% Get the current position of ZDrive
currentPosition = get(scope.ZDrive.Position, 'DisplayString');
disp(currentPosition);

%This is to check the shutter open
% shutterstatus = get(scope.LU4ALaser.IsOpenShutter,'DisplayString');
% disp(shutterstatus);

% set(scope.LightPathDrive.ChangeLightPath,1) %this is the enum for L100

% scope.Lasers.Connect(laser_serial)
% Check the value of AuxShutter.IsOpened
% shutterstatus = get(scope.Laser.IsOpenShutter,'DisplayString');
% disp(shutterstatus);


% shutterstatus = set(scope.LU4ALaser,'IsOpenShutter', 1); %assuming 1 is open ?!? and that scope.LU4ALaser works as the object to pass into set 
% 
% shutterstatus = get(scope.AuxShutter.IsOpened,'DisplayString');
% disp(shutterstatus);
% 
% shutterstatus = get(scope.EpiShutter.IsOpened,'DisplayString');
% disp(shutterstatus);
%scope.LU4ALaser.SaveObservationModeLU4A();
%scope.Lasers.Connect(laser_serial);

% this could be our issue with the laser not showing up needs to be set to mcherry
% filterblock = get(scope.FilterBlock.FilterType, 'DisplayString'); 
% disp(filterblock);
% 
% scope.FilterBlockCassette1.FilterBlocks(3 % need to figure out what position contains which filter
scope.FilterBlockCassette1.Forward()
% filterblock = get(scope.FilterBlockCassette1.FilterBlocks, 'DisplayString');



    


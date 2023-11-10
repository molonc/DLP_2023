% moveScopeZ.m
function moveScopeZ (app, distance)
    nikonconversion = (distance/2.5)*100; 
    app.ti.ZDrive.MoveRelative(nikonconversion);
end

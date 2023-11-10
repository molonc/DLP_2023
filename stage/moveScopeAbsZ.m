% moveScopeAbsZ.m
function moveScopeAbsZ (app, position)
    nikonconversion = (position/2.5)*100; 
    app.ti.ZDrive.MoveAbsolute(nikonconversion);
end

function waitBeforeMoving(app, distance)
    % Calculate the time it takes to move the given distance at maximum speed
    maxSpeedX = app.stageSpeed;  % Replace with your actual maximum speed for the X-axis
    timeToMove = abs(distance) / (maxSpeedX * 1000);  % Convert mm to m

    % Wait for the calculated time
    pause(timeToMove);
end

function moveFilterCube(app, position)
    % Get the current position of the filter cube from the microscope
    current_position_str = get(app.ti.FilterBlockCassette1.Position, 'DisplayString');
    current_position = str2double(current_position_str);

    % Compare the current position with the desired position
    while current_position ~= position
        % Move the filter cube in the appropriate direction
        if current_position > position
            app.ti.FilterBlockCassette1.Reverse();
        else
            app.ti.FilterBlockCassette1.Forward();
        end
        pause(0.3); % Adjust the pause duration as needed
        % Get the updated current position from the microscope
        current_position_str = get(app.ti.FilterBlockCassette1.Position, 'DisplayString');
        current_position = str2double(current_position_str);
    end

    % Update the filter cube position in the app
    app.filtercubeposition = position;
end

%this function images then splits them and then saves them 
function imaging(app, row, col, wavelength)

    %this is for autofocus not sure if it is neccessary yet 

    % app.vidobj.FocusMode = 'Auto'; % Set focus mode to autofocus
    % executeCommand(app.vidobj, 'AutoFocus');


    if app.checkBlue == 1 %if it's checked, the blue laser is turned on
        blueFolder = fullfile(app.dname,'Blue');
        mkdir(blueFolder);
    end
    if app.checkCyan == 1
        cyanFolder = fullfile(app.dname, 'Cyan');
        mkdir(cyanFolder);
    end
    if app.checkGreen == 1 
        greenFolder = fullfile(app.dname,'Green');
        mkdir(greenFolder);
    end
    inputImage = snapshot(app.vidobj); % this is how you take a image using a GigE cam which point grey is ??? 
   
    % Get the size of the input image
    % rows and cols are for the image not to be confused with the chip position
    [rows, cols] = size(inputImage);

    % Ensure the image can be evenly split into a 3x2 grid
    if mod(rows, 3) ~= 0 || mod(cols, 2) ~= 0
        error('Image size is not suitable for splitting into a 3x2 grid.');%not sure what we will do if we cant :)
    end

    % Calculate the size of each portion
    portionRows = rows / 3;
    portionCols = cols / 2;

    % Initialize the output cell array to store the portions
    splitImage = cell(3, 2);

    % Split the image into 3x2 portions
    for i = 1:3
        for j = 1:2
            % Calculate the indices for each portion
            startRow = (i - 1) * portionRows + 1;
            endRow = i * portionRows;
            startCol = (j - 1) * portionCols + 1;
            endCol = j * portionCols;

            % Extract the portion from the input image
            splitImage{i, j} = inputImage(startRow:endRow, startCol:endCol);
        end
    end
    

    %now the image is split inside of the matrix splitimage[3][2]

    for i = 1:3
        for j = 1:2
            % Build the file name based on row, column, i, and j
            fileName = sprintf('Image_Row%d_Col%d_Part%d_%d.tif', row, col, i, j); %probably need to add the laser that is being imaged as well 
            
            if wavelength == 440
                fullFileName = fullfile(blueFolder, fileName);
            end
            if wavelength == 470
                fullFileName = fullfile(cyanFolder, fileName);
            end
            if wavelegnth == 550
                fullFileName = fullfile(greenFolder, fileName);
            end         
            % Save the split image
            imwrite(splitImage{i, j}, fullFileName);
        end
    end


end 
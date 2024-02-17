function imaging(app, row, col, wavelength)
    
    % make it so it cre
    switch wavelength
        case 440
            folderName = 'Blue';
            changeExposure(app,app.BlueExposure); 
        case 470
            folderName = 'Cyan';
            changeExposure(app,app.CyanExposure);
        case 550
            folderName = 'Green';
            changeExposure(app,app.GreenExposure);
        case 510
            folderName = 'Teal';
            changeExposure(app,app.TealExposure);
        case 395 % UV
            folderName = 'UV';
            changeExposure(app,app.UVExposure);
        case 640
            folderName = 'Red';
            changeExposure(app,app.RedExposure);
        otherwise
            error('No valid wavelength selected.');
    end

    % Create folder based on selected wavelength
    wavelengthFolder = fullfile(app.dname, folderName);
   
    % If it doesn't exist, create it
    if ~exist(wavelengthFolder, 'dir')        
        mkdir(wavelengthFolder);
    end
    
    % Capture an image using the provided video object
    inputImage = getsnapshot(app.vidobj);

    % Use the splitAndSaveImage function
    splitAndSaveImage(inputImage, wavelengthFolder, row, col, folderName);

end

function changeExposure(app,value)
    src = getselectedsource(app.vidobj);
    src.Exposure = value;
end

function splitAndSaveImage(inputImage, folder, row, col, wavelength)
    % Get the size of the input image
    [rows, cols, ~] = size(inputImage);

    % Ensure the image can be evenly split into a 2x3 grid
    if mod(rows, 2) ~= 0 || mod(cols, 3) ~= 0
        error('Image size is not suitable for splitting into a 2x3 grid.');
    end

    % Calculate the size of each portion
    portionRows = rows / 2;
    portionCols = cols / 3;

    % Initialize the output cell array to store the portions
    splitImage = cell(1, 6);

    % Split the image into 2x3 portions
    for i = 1:2
        for j = 1:3
            % Calculate the indices for each portion
            startRow = round((i - 1) * portionRows) + 1;
            endRow = round(i * portionRows);
            startCol = round((j - 1) * portionCols) + 1;
            endCol = round(j * portionCols);

            % Extract the portion from the input image
            splitImage{(i - 1) * 3 + j} = inputImage(startRow:endRow, startCol:endCol, :);
        end
    end

    % Save the split images
    saveSplitImages(splitImage, folder, row, col, wavelength);
end

function saveSplitImages(splitImage, folder, row, col, wavelength)
    % Create S0000 folder inside the wavelength folder
    S0000Folder = fullfile(folder, 'S0000');
    if ~exist(S0000Folder, 'dir')
        mkdir(S0000Folder);
    end
    
    % Loop through all the split images
    for k = 1:numel(splitImage)
        % Calculate the row and column indices for the split image
        % based on the original 72x72 matrix grid
        imageRow = 2 * (row - 1) + ceil(k / 3);  % Calculate the actual row index
        imageCol = 3 * (col - 1) + mod(k - 1, 3) + 1;  % Calculate the actual column index
        
        if imageRow > 72
            imageRow = imageRow - 72;
        end
        if imageCol > 72
            imageCol = imageCol - 72;
        end
        % Calculate the corresponding column folder name (e.g., C01, C02, ..., C72)
        columnFolder = sprintf('C%02d', imageCol);
        columnFolderPath = fullfile(S0000Folder, columnFolder);
        
        % Create the column folder if it doesn't exist
        if ~exist(columnFolderPath, 'dir')
            mkdir(columnFolderPath);
        end
        if isequal(wavelength, 'Cyan')
            imnum = 0;
        else
            imnum = 1;
        end

        % Construct the file name with row and column information
        fileName = sprintf('R%02d_C%02d_0000_%02d_%s.tif', ...
            imageRow, imageCol, imnum, wavelength);


        % Save the split image into the corresponding column folder
        fullFileName = fullfile(columnFolderPath, fileName);
        imwrite(splitImage{k}, fullFileName);
    end
end



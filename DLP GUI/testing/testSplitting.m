function testSplitting()
    % Define the dimensions of the original 36x24 matrix
    originalRows = 36;
    originalCols = 24;
    
    % Loop through each cell in the original matrix
    for row = 1:originalRows
        for col = 1:originalCols
            % Simulate splitting the current cell into a 2x3 grid
            splitImage = simulateSplitting(row, col);
            
            % Simulate saving the split images using the provided function
            saveSplitImages(splitImage, 'Cyan', row, col, "Cyan");
        end
    end
end

function splitImage = simulateSplitting(row, col)
    % Simulate splitting the current cell into a 2x3 grid
    % For testing purposes, just create a dummy 2x3 grid
    splitImage = cell(1, 6);
    for i = 1:2
        for j = 1:3
            % Dummy image data
            image = rand(10, 10, 3);  % Random 10x10x3 image
            
            % Store the dummy image in the splitImage cell array
            splitImage{(i - 1) * 3 + j} = image;
        end
    end
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
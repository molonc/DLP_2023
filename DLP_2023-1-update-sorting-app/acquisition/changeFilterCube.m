function changeFilterCube (app, fc)
    switch fc
        case 'Empty'
            moveFilterCube(app,1);
        case 'Analyzer'
            moveFilterCube(app,2);
        case 'CFP-YFP-mCherry (Ex. 440-508-575)'
            moveFilterCube(app,3);
        case 'DAPI-FITC-CY3-CY5 (Ex. 395-470-555-640)'
            moveFilterCube(app,4);
        case 'Penta-Cube DO NOT USE'
            moveFilterCube(app,5);
    end
end
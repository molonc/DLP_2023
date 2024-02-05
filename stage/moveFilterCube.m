function moveFilterCube(app, position)
    if app.filtercubeposition ~= position 
        while(app.filtercubeposition > position)
            app.ti.FilterBlockCassette1.Reverse();
            app.filtercubeposition = app.filtercubeposition - 1;
            pause(.5);
        end
        while (app.filtercubeposition < position)
            app.ti.FilterBlockCassette1.Forward();
            app.filtercubeposition = app.filtercubeposition + 1;
            pause(.5);
        end
    end
    app.filtercubeposition = position;
end
function [app] = connect2scope(app)
    app.ti = actxserver('Nikon.TiScope.NikonTI');
end
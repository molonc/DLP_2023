function [app] = connect2camera(app)
    app.vidobj = videoinput('pointgrey', 1,'F7_Mono16_1920x1200_Mode0');
end 
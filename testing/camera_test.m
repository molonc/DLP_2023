%info = imaqhwinfo
vid = videoinput('winvideo', 1,'RGB32_1920x1144');
%videoinput()
% Set up video object properties (adjust as needed)
vid.FramesPerTrigger = Inf;
vid.ReturnedColorspace = 'rgb';

  
% Start the video input object for preview
preview(vid);
% 

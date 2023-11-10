function [value] = getConfig(param)
% Gets a paritcular configuration value specified by the value's key
% (param)

global global_config;

if isempty(global_config)
    global_config = [];
end

%%% Serial Communication Ports %%%

% Lasers
% global_config.LASER_395_PORT = 'COM15';
% global_config.LASER_440_PORT = 'COM9';
% global_config.LASER_470_PORT = 'COM16'; 
% global_config.LASER_510_PORT = 'COM1'; 
% global_config.LASER_550_PORT = 'COM2'; 
% global_config.LASER_575_PORT = 'COM4'; 
% global_config.LASER_640_PORT = 'COM5'; 
global_config.LASER_PORT = 'COM3';


% Triggering
global_config.TRIGGER_PORT = 'COM5';

% XY Stage
global_config.STAGE_PORT = 'COM4';

if isfield(global_config, param)
    value = global_config.(param);
else
   value = '';
end

end

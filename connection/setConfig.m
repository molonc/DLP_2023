function [] = setConfig(param, value)
% Sets a particular configuration value specified by (param, value)

    global global_config;
    Config.get_config();
    global_config.(param) = value;
end


function [cNumber] = getCNumber(cyan,cyan_mask,green,green_mask,multi)
%Returns expected C number given cyan and green signal
%   takes in non-zero signal for cyan and green  example image(mask > 0)
    
    %No object detected protection
    % this is important since we try to mask out cell to look at intensity
    % values
    if max(cyan_mask(:)) == 0
        cyan_signal = zeros(5);
    else
        cyan_signal = cyan(cyan_mask > 0);
    end
    if max(green_mask(:)) == 0
        green_signal = zeros(5);
    else
        green_signal = green(green_mask > 0);
    end
    
    
    

    % compare avg cell intensity cyan vs green
    if  multi == false && (max(cyan_signal(:)) > 0 &&  max(green_signal(:)) > 0)
       if prctile(cyan_signal(:),95) > prctile(green_signal(:),95)
            cNumber = "C1";
       else
           cNumber = "C2";
       end
    else
        cNumber = "C3";
    end
end
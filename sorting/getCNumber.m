
function [cNumber] = getCNumber(cyan,green,multi)
%Returns expected C number given cyan and green signal
%   takes in non-zero signal for cyan and green o example image(mask > 0)
    if ~multi && max(cyan(:)) > 0 ||  max(green(:)) > 0
       if mean(cyan(:)) > mean(green(:))
            cNumber = "C1";
       else
           cNumber = "C2";
       end
    else
        cNumber = "C3";
    end
end
function [intensity_vals] = intensity_metrics(img,mask)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    img_min = min(img(mask),[],'all');
    img_max = max(img(mask),[],'all');
    img_median = median(img(mask),'all');
    pct = [prctile(img(mask),25) prctile(img(mask),75) prctile(img(mask),95)];
    totat_intensity = sum(img(mask));
    intensity_vals = [img_min img_max img_median pct totat_intensity];
end
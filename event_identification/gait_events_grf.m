function [heel_strikes, toe_offs] = gait_events_grf(grf)
%This function uses a 10N ground reaction force threshold to identify heel 
%strikes and toe offs during locomotion 
%Created by: Daniel Kuhman
%Last updated: 2020-05-16
%Input: continuous time series vertical ground reaction force
%Output: arrays containing frame numbers of heel strikes and toe offs

heel_strikes = [];
toe_offs = [];

for i = 1:length(grf)
    if i == length(grf)
        break
    elseif grf(i) < 10 && grf(i+1) > 10
        heel_strikes(end+1) = i + 1;
    elseif grf(i) > 10 && grf(i+1) < 10
        toe_offs(end+1) = i;
    end
end

end


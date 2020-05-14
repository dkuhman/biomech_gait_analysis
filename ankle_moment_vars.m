function [peak_ext_moment, peak_flx_moment, ext_angular_impulse,...
    flx_angular_impulse] = ankle_moment_vars(ankle_moment, frame_rate)
%This function finds peak ankle plantarflexor (positive) and dorsiflexor
%(negative) moments and angular impulses. Impulses are found by integrating
%the moment curve with respect to time. 
%ASSUMES EXTENSOR MOMENTS ARE POSITIVE AND FLEXOR MOMENTS ARE NEGATIVE
%Inputs: support phase ankle moment curve, kinematic frame rate
%Outputs: peak ankle plantarflexor moment, peak ankle dorsiflexor moment,
    %ankle plantarflexor angular impulse, ankle dorsiflexor angular impulse
%Author: Daniel Kuhman
%Github: https://github.com/dkuhman
%Date created: 2020-01-22

%Peak extensor (positive) moment
peak_ext_moment = max(ankle_moment);

%Extensor angular impulse
ext_angular_impulse = trapz(ankle_moment(ankle_moment > 0))/frame_rate;

%Peak flexor (negative) moment
peak_flx_moment = min(ankle_moment);

%Flexor angular impulse
flx_angular_impulse = trapz(ankle_moment(ankle_moment < 0))/frame_rate;

end


function [peak_ext_moment, peak_flx_moment, ext_angular_impulse,...
    flx_angular_impulse] = knee_moment_vars(knee_moment,frame_rate)
%This function finds knee extensor (positive) and flexor (negative) peak
%moments and angular impulses. Impulses are found by integrating
%the moment curve with respect to time. 
%ASSUMES EXTENSOR MOMENTS ARE POSITIVE AND FLEXOR MOMENTS ARE NEGATIVE
%Inputs: support phase knee moment curve, kinematic frame rate
%Outputs: peak knee extensor moment, peak knee flexor moment,
    %knee extensor angular impulse, knee flexor angular impulse
%Author: Daniel Kuhman
%Github: https://github.com/dkuhman
%Updated: 2020-05-14

%Knee Extensor Peak Moment
peak_ext_moment = max(knee_moment(knee_moment > 0));

%Knee Extensor Angular Impulse
ext_angular_impulse = trapz(knee_moment(knee_moment > 0))/frame_rate;

%Knee Flexor Peak Moment
peak_flx_moment = min(knee_moment(knee_moment < 0));

%Knee Flexor Angular Impulse
flx_angular_impulse = trapz(knee_moment(knee_moment < 0))/frame_rate;

end


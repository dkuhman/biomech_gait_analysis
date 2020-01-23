function [peak_ext_moment, peak_flx_moment, ext_angular_impulse,...
    flx_angular_impulse] = hip_moment_vars(hip_moment,frame_rate)
%This function finds hip extensor (positive) and flexor (negative) peak
%moments and angular impulses. Impulses are found by integrating
%the moment curve with respect to time. 
%ASSUMES EXTENSOR MOMENTS ARE POSITIVE AND FLEXOR MOMENTS ARE NEGATIVE
%Inputs: support phase hip moment curve, kinematic frame rate
%Outputs: peak hip extensor moment, peak hip flexor moment,
    %hip extensor angular impulse, hip flexor angular impulse
%Author: Daniel Kuhman
%Contact: danielkuhman@gmail.com
%Date created: 1/22/2020

%Peak hip extensor (positive) moment
peak_ext_moment = max(hip_moment);

%Hip extensor angular impulse
ext_angular_impulse = trapz(hip_moment(hip_moment > 0))/frame_rate;

%Peak hip flexor (negative) moment
peak_flx_moment = min(hip_moment);

%Hip flexor angular impulse
ext_angular_impulse = trapz(hip_moment(hip_moment < 0))/frame_rate;

end


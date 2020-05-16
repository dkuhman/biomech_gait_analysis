function [peak_ext_pos_pwr, ext_pos_work, peak_flx_neg_pwr,...
    flx_neg_work, peak_flx_pos_pwr, flx_pos_work, total_pos_work, total_neg_work] = ...
    hip_power_vars(hip_moment,hip_power,frame_rate)
%This function finds hip joint power and mechanical work variables. 
%The hip moment is used to identify periods of extensor and flexor activity.
%This script ASSUMES THAT EXTENSOR MOMENTS ARE POSITIVE AND FLEXOR MOMENTS
%ARE NEGATIVE.
%Inputs: support phase hip moment and power curves, kinematic frame rate
%Outputs: hip extensor peak positive power and positive work, hip flexor
%peak negative power and negative work, hip flexor peak positive power and
%positive work, total positive and negative work across the whole joint
%Author: Daniel Kuhman
%Github: https://github.com/dkuhman
%Date created: 2020-01-24

%Total positive and negative work
total_pos_work = trapz(hip_power(hip_power > 0))/frame_rate;
total_neg_work = trapz(hip_power(hip_power < 0))/frame_rate;

%Isolate periods of extensor and flexor activity
hip_ext_frames = find(hip_moment > 0);
hip_flx_frames = find(hip_moment < 0);

hip_ext_power = hip_power(hip_ext_frames);
hip_flx_power = hip_power(hip_flx_frames);

%Hip extensor variables
peak_ext_pos_pwr = max(hip_ext_power);
ext_pos_work = trapz(hip_ext_power(hip_ext_power > 0))/frame_rate;

%Hip flexor variables
peak_flx_pos_pwr = max(hip_flx_power);
flx_pos_work = trapz(hip_flx_power(hip_flx_power > 0))/frame_rate;

peak_flx_neg_pwr = min(hip_flx_power);
flx_neg_work = trapz(hip_flx_power(hip_flx_power < 0))/frame_rate;
end


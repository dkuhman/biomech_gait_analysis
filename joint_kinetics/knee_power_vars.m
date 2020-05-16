function [knee_ext_peak_pos_pwr, knee_ext_pos_work, knee_total_pos_work,...
    knee_total_neg_work]...
    = knee_power_vars(knee_power, knee_moment, frame_rate)
%This function finds knee joint mechanical variables of interest for gait analysis.  
%Inputs: support phase knee power curve, knee moment curve, kinematic frame rate
%Outputs: peak extensor positive power, extensor positive work, total positive
%work, total negative work
%Author: Daniel Kuhman
%Github: https://github.com/dkuhman
%Date created: 2020-05-14

%Total Positive Work
knee_total_pos_work = trapz(knee_power(knee_power > 0))/frame_rate;

%Total Negative Work
knee_total_neg_work = trapz(knee_power(knee_power < 0))/frame_rate;

%Knee Extensor Peak Positive Power
knee_ext_power = knee_power(knee_moment > 0);
knee_ext_peak_pos_pwr = max(knee_ext_power);

%Knee Extensor Peak Positive Power
knee_ext_pos_work = trapz(knee_ext_power(knee_ext_power > 0))/frame_rate;

end


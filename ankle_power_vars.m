function [peak_positive_power, positive_work, negative_work]...
    = ankle_power_vars(ankle_power,frame_rate)
%This function finds ankle joint peak power and mechanical work.  
%Inputs: support phase ankle power curve, kinematic frame rate
%Outputs: peak positive power, positive work, negative work
%Author: Daniel Kuhman
%Github: https://github.com/dkuhman
%Date created: 2020-01-22

%Peak ankle power
peak_positive_power = max(ankle_power);

%Ankle joint positive work
positive_work = trapz(ankle_power(ankle_power > 0))/frame_rate;

%Ankle joint negative work
negative_work = trapz(ankle_power(ankle_power < 0))/frame_rate;

end


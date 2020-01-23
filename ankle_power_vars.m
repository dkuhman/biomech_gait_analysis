function [peak_positive_power, positive_work, negative_work]...
    = ankle_power_vars(ankle_power,frame_rate)
%This function finds ankle joint peak power and mechanical work. 
%Work is found by integrating the moment curve with respect to time. 
%Inputs: support phase ankle power curve, kinematic frame rate
%Outputs: peak positive power, positive work, negative work
%Author: Daniel Kuhman
%Contact: danielkuhman@gmail.com
%Date created: 1/22/2020

%Peak ankle power
peak_positive_power = max(ankle_power);

%Ankle joint positive work
positive_work = trapz(ankle_power(ankle_power > 0))/frame_rate;

%Ankle joint negative work
negative_work = trapz(ankle_power(ankle_power < 0))/frame_rate;

end


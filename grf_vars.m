function [vertical_peak1,vertical_peak2,vertical_impulse,...
    ap_peak_brake, ap_brake_impulse, ap_peak_propulsion, ap_propulsion_impulse]...
    = grf_vars(vertical_grf,ap_grf,frame_rate)
%This function quantifies variables related to vertical and anteroposterior
%ground reaction forces during walking. Impulses are found by 
%integrating the force curve with respect to time. This script assumes that
%the vertical force is positive, the anteroposterior braking force
%is negative, the anteroposterior propulsive force is positive.
%Inputs: support phase vertical ground reaction force, support phase
    %anteroposterior ground reaction force, kinetic frame rate
%Outputs: first and second peaks from vertical ground reaction force and
    %the impulse of the entire support phase, peak braking and propulsive
    %anteroposterior ground reaction forces and their impulses.
%Author: Daniel Kuhman
%Github: https://github.com/dkuhman
%Updated: 2020-01-24

%Cut the vertical GRF into 1st and 2nd halves. This will allow us to get a
%first half max (firstPeakVertGRF) and a secund half max (secondPeakVertGRF).
vertical_mid_frame = round(length(vertical_grf)/2);
vertical_first_half = vertical_grf(1:vertical_mid_frame);
vertical_second_half = vertical_grf(vertical_mid_frame:end);

%First and second peak vertical GRFs
vertical_peak1 = max(vertical_first_half);
vertical_peak2 = max(vertical_second_half);

%Impulse of the vertical GRF
vertical_impulse = trapz(vertical_grf)/frame_rate;

%---------------------------ANTEROPOSTERIOR GRFS---------------------------
%Peak Braking
[ap_peak_brake, peak_brake_index] = min(ap_grf);

%Braking Impulse
ap_brake_impulse = trapz(ap_grf(ap_grf < 0))/frame_rate;

%Peak Propulsive
ap_peak_propulsion = max(ap_grf(peak_brake_index:end));

%Propulsive Impulse
ap_propulsion_impulse = trapz(ap_grf(ap_grf > 0))/frame_rate;

end


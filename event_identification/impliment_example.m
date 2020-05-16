%Clear workspace and load data
clear all; clc
load('grf_gait_events_data.mat')

%Isolate vertical GRF 
grf_z = data.grf_z;

%Run the function
[heel_strikes, toe_offs] = gait_events_grf(grf_z);

%Plot to ensure proper event ID
figure
plot(grf_z, '-b', 'LineWidth', 1.5)
hold on
plot(heel_strikes, 0, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g')
plot(toe_offs, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r')
hold off
xlim([0 length(grf_z)])
ylim([-10 max(grf_z)+50])
xlabel('Frames')
ylabel('Vertical GRF (N)')
%Clear workspace and load data
clear all; clc
load('grf_gait_events_data.mat')

%Isolate vertical GRF 
grf_z = data.grf_z;

%Capture frequency of the force platform
frame_rate = 1000;

%Apply a 4th order lowpass Butterworth filter with cutoff frequency of 6Hz
[B, A] = butter(4, 6/frame_rate);
grf_z_filt = filtfilt(B, A, grf_z);

%Plot initial and filtered data
figure
plot(grf_z, '-b', 'LineWidth', 1.5)
hold on
plot(grf_z_filt, '-r', 'LineWidth', 1.5)
hold off
legend('Original', 'Filtered')
xlabel('Frames')
ylabel('Vertical GRF (N)')

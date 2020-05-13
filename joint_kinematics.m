function [hip_ROM, hip_avg_pos , knee_ROM, knee_avg_pos , ankle_ROM, ankle_avg_pos ] ...
    = joint_kinematics(hipAngle_sagittal, kneeAngle_sagittal, ankleAngle_sagittal,...
    static_hip, static_knee, static_ankle)
%This function identifies hip, knee, ankle kinematic variables of interest
%Inputs:support phase hip, knee, ankle joint angle curves
%Exports: peak hip extension and flexion, peak knee flexion, peak ankle
%dorsiflexion and plantarflexion

%-------------------------------STATIC ANGLES------------------------------
hip_staticPos = mean(static_hip);
knee_staticPos = mean(static_knee);
ankle_staticPos = mean(static_ankle);

%Norm the hip, knee, and ankle dynamic angles to the static angles
hip_normed = hipAngle_sagittal - hip_staticPos;
knee_normed = kneeAngle_sagittal - knee_staticPos;
ankle_normed = ankleAngle_sagittal - ankle_staticPos;

%--------------------------------HIP JOINT---------------------------------
hip_ROM = max(hip_normed) - min(hip_normed);
hip_avg_pos = mean(hip_normed);
%-------------------------------KNEE JOINT---------------------------------
knee_ROM = max(knee_normed) - min(knee_normed);
knee_avg_pos = mean(knee_normed);

%------------------------------ANKLE JOINT---------------------------------
ankle_ROM = max(ankle_normed) - min(ankle_normed);
ankle_avg_pos = mean(ankle_normed);

end


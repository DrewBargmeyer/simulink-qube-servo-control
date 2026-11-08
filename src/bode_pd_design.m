%% Frequency Domain Bode Plot PD Design for QUBE Servo 2
clear; clc; close all;

Kp = 7.84;
Kd = 0.98;
K = 24;
tau = 0.165;

Gc = tf([Kd Kp], 1);
Gp = tf([K], [tau 1 0]);
Gp_open = Gc * Gp;

figure;
bode(Gp_open); grid on;
title('Open Loop Bode Diagram with PD Compensator');

Sys_cl = feedback(Gp_open, 1);
figure;
step(Sys_cl); grid on;
title('Closed Loop Step Response (Bode Design)');
stepinfo(Sys_cl)

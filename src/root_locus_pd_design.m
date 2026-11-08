%% Root Locus PD Controller Design for QUBE Servo 2
clear; clc; close all;

% Plant Parameters
K = 24;
tau = 0.165;
Gp = tf([K], [tau 1 0]); % Open loop motor transfer function

% Initial Prelab Gain Evaluation
Kp = 5.78;
Go1 = Kp * Gp;
G_cl_1 = feedback(Go1, 1);

figure;
step(G_cl_1); grid on;
title('Uncompensated Step Response');

% Root Locus Analysis for Derivative Gain (Kd)
Ps2 = tf([K 0], [tau 1 Kp*K]);
figure;
rlocus(Ps2); grid on;
sgrid(0.7, []);
title('Root Locus for Kd Gain Selection');

% Hardware Tuned Controller Execution (Kp = 5.78, Kd = 0.25)
Kd = 0.25;
Gc = tf([Kd Kp], 1);
Go2 = Gc * Gp;
G_cl_2 = feedback(Go2, 1);

figure;
step(G_cl_2); grid on;
title('Tuned PD Closed Loop Step Response');
stepinfo(G_cl_2)

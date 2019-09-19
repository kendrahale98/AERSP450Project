% AERSP 450, Project 1
% Kendra Hale, Kelly Harnish
clc; clear; close all;

Omega = 20;%deg/sec
% omega_BN = [Omega*sin(0.01*t) 0.01 Omega*cos(0.01*t)];

%% a) Numerically integrate the qaternions with omega_BN over 2 minutes
% assuming the body frame is aligned with the intertial frame


%% b) discretise the time intervale with delta = 0.01 sec, coompute
% quaternions at each time by using the given STM

t = 1:0.01:120;%sec
for k = 1:length(t)
    omega_BN = [Omega*sin(0.01*t) 0.01 Omega*cos(0.01*t)];

    Bomega = [0 -omega_BN(1) -omega_BN(2) -omega_BN(3);...
        omega_BN(1) 0 omega_BN(3) -omega_BN(2);...
        omega_BN(2) -omega_BN(3) 0 omega_BN(1);...
        omega_BN(3) omega_BN(2) -omega_BN(1) 0];
    
    phi(t(k)) = exp(-0.5*Bomega*t);
    beta(t(k+1)) = phi(t(k),t(k+1))*beta(k);
end

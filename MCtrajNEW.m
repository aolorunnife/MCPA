function [] = MCtraj(type, nTraj)
% clear all
close all;
%clearvars
%clearvars -GLOBAL
%close all

% set(0,'DefaultFigureWindowStyle','docked')
global C

set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth', 2);

C.q_0 = 1.60217653e-19;             % electron charge
C.hb = 1.054571596e-34;             % Dirac constant
C.h = C.hb * 2 * pi;                    % Planck constant
C.m_0 = 9.10938215e-31;             % electron mass
C.kb = 1.3806504e-23;               % Boltzmann constant
C.eps_0 = 8.854187817e-12;          % vacuum permittivity
C.mu_0 = 1.2566370614e-6;           % vacuum permeability
C.c = 299792458;                    % speed of light
C.g = 9.80665; %metres (32.1740 ft) per s²


x = 0;
v = [0];  %making v a vector
dt = 1;
F = 1;
m = 1;
t = 0;


nTime = 100;

subplot(2,1,1)
plot (t,v(1), 'o');
hold on;

subplot(2,1,2)
    plot (t,x, 'bo');
    hold on;

hold on;

for i = 1: nTime
    t = t + dt;
    v(i+1) = v(i)+dt*F/m;   %calculate new velocity
    x= x + dt*v(i+1);

    %scattering

    if rand(1,1) < 0.05
      v(i+1) = 0;
    end
    
    vavg = mean(v)  %drift velocity

    subplot(2,1,1)
    plot (t,v(i+1), 'ro');  %velocity
    plot(t,vavg, 'go')
    hold on;
    subplot(2,1,2)
    plot (t,x, 'bo');  %position
    hold on
    pause (0.001)


end
hold off



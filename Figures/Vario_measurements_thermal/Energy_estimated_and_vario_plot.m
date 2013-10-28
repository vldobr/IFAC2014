close all
clear all
clc

load('E_dot_and_vario_2.mat')

% Create vector time
time = 0.01:0.01:length(E_dot_and_vario(6000:8500,1))/100;

% Plot Edot vs vario from condor
figure1 = figure('Color',[1 1 1]);
subplot(28,1,[1:20])
plot(time,E_dot_and_vario(6000:8500,1),'k','LineWidth',1.5)
hold on
plot(time,E_dot_and_vario(6000:8500,2),'--k','LineWidth',1.5)
ylabel('$Rate of change of total energy \dot{E} (m/s)$','Interpreter','latex')
title('Energy variation estimated vs variometers')
L = legend('$\dot{E}$','$\dot{h}_{TEK}$',1);
set(L,'Interpreter','latex')
grid on


subplot(28,1,[23:28])
plot(time,E_dot_and_vario(6000:8500,5),'k')
xlabel('Time (s)')
L1 = legend('$Roll  angle (rad)$',1);
set(L1,'Interpreter','latex')
grid on



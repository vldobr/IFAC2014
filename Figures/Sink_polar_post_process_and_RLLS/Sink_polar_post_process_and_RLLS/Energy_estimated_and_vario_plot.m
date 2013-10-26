close all
clear all
clc

load('E_dot_and_vario.mat')

% Plot Edot vs vario from condor
plot(E_dot_and_vario(38000:43000,1),'r')
hold on
plot(E_dot_and_vario(38000:43000,2),'--k')
xlabel('Time (ms)')
ylabel('Rate of change in energy (m/s)')
title('Energy variation estimated vs variometer')
legend('E_{dot} estimated','Variometer',0)
grid on
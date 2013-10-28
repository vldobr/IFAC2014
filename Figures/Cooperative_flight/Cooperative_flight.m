close all
clear all
clc


load('glider1_states.mat')
load('glider2_states.mat')
load('glider3_states.mat')
format long

% Plot altitude variation
figure1 = figure('Color',[1 1 1]);
init_time = glider1_states(173+30000,1);
plot(glider1_states(173+30000:77677,1)-(init_time),glider1_states(173+30000:77677,3),'k','LineWidth',1.5)
hold on
plot(glider2_states(2608+30000:79975,1)-(init_time),glider2_states(2608+30000:79975,3),'g','LineWidth',1.5)
plot(glider3_states(1002+30000:78512,1)-(init_time),glider3_states(1002+30000:78512,3),'r','LineWidth',1.5)
xlabel('Time (sec)')
ylabel('Altitude (m)')
title('Gain in altitude')
legend('Glider 1','Glider 2','Glider 3',0)
axis([0 500 1400 2600])
grid on

% Plot paths and thermal
figure2 = figure('Color',[1 1 1]);

% Plot thermal
x0 = 15.0507; y0 = 46.4108;
sigma_x = 0.004;
sigma_y = 0.004;
A = 2580;
[X,Y] = meshgrid(x0-0.009:0.0001:x0+0.009, y0-0.009:0.0001:y0+0.009);
Z = A*exp( - (((X-x0).^2)./(2*sigma_x^2) + ((Y-y0).^2)./(2*sigma_y^2)));
surf(X,Y,Z,'FaceAlpha',0.2,'EdgeColor','none','FaceColor',[1 0.4 0]);
view(26,36)
hold on
% Plot paths
plot3(glider1_states(173+30000:77677,39),glider1_states(173+30000:77677,38),glider1_states(173+30000:77677,3),'k')
plot3(glider2_states(2608+30000:79975,39),glider2_states(2608+30000:79975,38),glider2_states(2608+30000:79975,3),'g')
plot3(glider3_states(1002+30000:78512,39),glider3_states(1002+30000:78512,38),glider3_states(1002+30000:78512,3),'r')

xlabel('Longitude (deg)')
ylabel('Latitude (deg)')
zlabel('Altitude (m)')
title('Paths in cooperative flight')
legend('Thermal','Glider 1','Glider 2','Glider 3',1)


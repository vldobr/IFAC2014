close all
clear all
clc


load('glider1_states_2.mat')
load('glider2_states_2.mat')
load('glider3_states_2.mat')
format long

% Plot altitude variation
figure1 = figure('Color',[1 1 1]);
init_time = glider1_states(8946+2500,1);
plot(glider1_states(8946+2500:110841-30000,1)-(init_time),glider1_states(8946+2500:110841-30000,3),'k','LineWidth',1.5)
hold on
plot(glider2_states(5697+2500:107594-30000,1)-(init_time),glider2_states(5697+2500:107594-30000,3),'g','LineWidth',2)
plot(glider3_states(12+2500:101888-30000,1)-(init_time),glider3_states(12+2500:101888-30000,3),'r','LineWidth',2)
xlabel('Time, sec')
ylabel('Altitude, m')
% title('Gain in altitude')
legend('Glider 1','Glider 2','Glider 3',0)
axis([0 700 1000 4000])
grid on

% Plot paths and thermal
figure2 = figure('Color',[1 1 1]);

% Plot thermal
x0 = 15.1342; y0 = 46.51;
sigma_x = 0.006;
sigma_y = 0.006;
A = 4100;
[X,Y] = meshgrid(x0-0.015:0.0001:x0+0.015, y0-0.015:0.0001:y0+0.015);
Z = A*exp( - (((X-x0).^2)./(2*sigma_x^2) + ((Y-y0).^2)./(2*sigma_y^2)));
surf(X,Y,Z,'FaceAlpha',0.2,'EdgeColor','none')%,'FaceColor',[0 0.6 1]);
view(74,38)
hold on
% Plot paths
plot3(glider1_states(8946+2500:110841-30000,39),glider1_states(8946+2500:110841-30000,38),glider1_states(8946+2500:110841-30000,3),'k','LineWidth',1.5)
plot3(glider2_states(5697+2500:107594-30000,39),glider2_states(5697+2500:107594-30000,38),glider2_states(5697+2500:107594-30000,3),'g','LineWidth',1.5)
plot3(glider3_states(12+2500:101888-30000,39),glider3_states(12+2500:101888-30000,38),glider3_states(12+2500:101888-30000,3),'r','LineWidth',1.5)


a2 = gca;
set(a2,'FontSize',12)
xlabel('Longitude, deg','FontSize',12)
ylabel('Latitude, deg','FontSize',12)
zlabel('Altitude, m','FontSize',12)
% title('Paths in cooperative flight')
leg = legend('Thermal','Glider 1','Glider 2','Glider 3',1);
set(leg,'FontSize',12)
legend('boxoff')

% Plot starting points
plot3(glider1_states(8946+2500,39),glider1_states(8946+2500,38),glider1_states(8946+2500,3),'pk','MarkerSize',12)
plot3(glider2_states(5697+2500,39),glider2_states(5697+2500,38),glider2_states(5697+2500,3),'pg','MarkerSize',12)
plot3(glider3_states(12+2500,39),glider3_states(12+2500,38),glider3_states(12+2500,3),'pr','MarkerSize',12)



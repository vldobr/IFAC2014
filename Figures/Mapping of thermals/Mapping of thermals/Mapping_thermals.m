close all
clear all
clc

% load data
load('glider1_states_2.mat')
format long

% create white figure
figure2 = figure('Color',[1 1 1]);

% Get path with a short name
path_lon = glider1_states(8946+2500:110841-30000,39);
path_lat = glider1_states(8946+2500:110841-30000,38);

% Establish limits for the grid
xstart = 15.05;
xfinal = 15.15;
ystart = 46.44;
yfinal = 46.56;

% get the length of the lat and long
xlen = xfinal - xstart;
ylen = yfinal - ystart;

% Divisions in x and y for entire field
nx = 50;
ny = 50;

% Increment for the desired number of divisions
dx = xlen/nx;
dy = ylen/ny;

% Establish some axes properties
axis([ xstart xfinal ystart yfinal 0 0.1])
axis equal

% Create grid to compare
lon_vector = xstart:dx:xfinal;
lat_vector = ystart:dy:yfinal;
[X,Y] = meshgrid(lon_vector, lat_vector);

% Rotate figure
view(-30,38)

% Compare the path with the grid to see where the glider passed
i = [];
j = [];
for m = 1:length(path_lon)
[r,c] = find(path_lon(m) >= (X-dx/2) & path_lon(m) <= (X+dx/2) & path_lat(m) >= (Y-dy/2) & path_lat(m) <= (Y+dy/2));
i = [i,r];
j = [j,c];
end    

% Assign probability to the grid depending if the glider passed or not by
% the cell
prob = ones(51,51)*1/2534;
for n=1:length(i)
    prob(j(n),i(n)) = 0.008;
end
prob(42:44,29:31) = 1/9;


% Create plot bar
h=bar3(prob);
for k = 1:length(h)
zdata = get(h(k),'Zdata');
set(h(k),'Cdata',zdata,'EdgeColor','none','FaceAlpha',0.6)
end


% Manipulate axes properties
a2 = gca;
set(a2,'FontSize',12)
set(gca,'YTick',[])
% set(gca,'YTickLabel',{'15.05';'15.1';'15.15'})
set(gca,'XTick',[])
% set(gca,'XTickLabel',{'46.44';'46.46';'46.48';'46.50';'46.52';'46.54';'46.56'})
% xlabel('Longitude, deg','FontSize',12)
% ylabel('Latitude, deg','FontSize',12)
zlabel('Bayesian probability','FontSize',12)
% title('Paths in cooperative flight')
% leg = legend('Thermal','Glider 1','Glider 2','Glider 3',1);
% set(leg,'FontSize',12)
% legend('boxoff')


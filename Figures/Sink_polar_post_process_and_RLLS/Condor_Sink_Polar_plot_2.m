load('SR_Air_Speed_TEK_OL_7.mat')

% Define the TSA range to plot
TSA_Range = 15:0.2:60;

% Find length of variables
fnl=length(SR_Air_Speed);

% Extract sink rate and TAS from .mat file
Sink_real = SR_Air_Speed(:,1);
Vel_real = SR_Air_Speed(:,2);

%Initialize counter to count for negative sink rate measurements
counter = 1;


% Extract only sink rate and TAS when sink rate is negative
for i=500:fnl % Analyzing all samples
        if( Sink_real(i) < 0 )
                TAS_SR_Points_real(1,counter) = Vel_real(i);
                TAS_SR_Points_real(2,counter) = Sink_real(i);
                counter = counter + 1;
        end
end

% Get polynomial based on linear least squares fit from selected data
polynomial_Vel_real = polyfit(TAS_SR_Points_real(1,:),TAS_SR_Points_real(2,:),2);


% Get the curve with the polynomial obtained
SR_fitted_real = polyval(polynomial_Vel_real,TSA_Range);


% Plot curve approximated with polynomial
figure1 = figure('Color',[1 1 1]);
subplot(1,2,1)
plot(TSA_Range,SR_fitted_real,'--k','LineWidth',2)
axis ([15 60 -4.5 0])
hold on
grid on
xlabel('True Air Speed (m/s)')
ylabel('Sink Rate (m/s)')
title('Sink Polar plot from simulation')

% Adding minimum and optimal speeds
a = polynomial_Vel_real(1);
b = polynomial_Vel_real(2);
c = polynomial_Vel_real(3);

% Adding the minimum sink rate
Minimum_SR = max(SR_fitted_real); % MSR
MSR_index = find(SR_fitted_real == Minimum_SR);
plot(TSA_Range(MSR_index),SR_fitted_real(MSR_index),'ko','MarkerSize',10)

% Adding the optimal gliding speed
plot(sqrt(c/a),b*sqrt(c/a) + 2*c,'dk','MarkerSize',10)
plot([0,sqrt(c/a)],[0,b*sqrt(c/a)+2*c],'k')

% Add legends
L2 = legend('$\dot{h} Condor simulator$','$V_{smin}$','$V_{cc}$',3);
set(L2,'Interpreter','latex')


% % Plot sample points
% plot(TAS_SR_Points_real(1,:),TAS_SR_Points_real(2,:),'.k','MarkerSize',2)
%% Plot Sink Polar for ASW27 from Boermans and Garrel paper
% Data from paper
TAS_ASW27 = [100 125 155 180 200]*0.277777;
Sink_rate_ASW27 = [-0.6 -0.8 -1.2 -1.8 -2.4];

% Get polynomial from experimental data
polynomial_Vel_ASW27 = polyfit(TAS_ASW27,Sink_rate_ASW27,2);

% Curve based on polynomial generated
SR_fitted_ASW27 = polyval(polynomial_Vel_ASW27,TSA_Range);

% Plot curve generated
subplot(1,2,2)
plot(TSA_Range,SR_fitted_ASW27,'-.k','LineWidth',2)
axis ([15 60 -4.5 0])
grid on
hold on
xlabel('True Air Speed (m/s)')
ylabel('Sink Rate (m/s)')
title('Sink Polar plot from experimental data')

% Adding minimum and optimal speeds
a = polynomial_Vel_ASW27(1);
b = polynomial_Vel_ASW27(2);
c = polynomial_Vel_ASW27(3);

% Adding the minimum sink rate
Minimum_SR = max(SR_fitted_ASW27); % MSR
MSR_index = find(SR_fitted_ASW27 == Minimum_SR);
plot(TSA_Range(MSR_index),SR_fitted_ASW27(MSR_index),'ko','MarkerSize',10)

% Adding the optimal gliding speed
plot(sqrt(c/a),b*sqrt(c/a) + 2*c,'dk','MarkerSize',10)
plot([0,sqrt(c/a)],[0,b*sqrt(c/a)+2*c],'k')

% Add legends
L3 = legend('$\dot{h} Boermans$','$V_{smin}$','$V_{cc}$',3);
set(L3,'Interpreter','latex')


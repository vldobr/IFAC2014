load('SR_Air_Speed.mat')

% Find length of variables
fnl=length(SR_Air_Speed);

% Extract sink rate and TAS from .mat file
Sink_real = SR_Air_Speed(:,1);
Vel_real = SR_Air_Speed(:,2);

%Initialize counter to count for negative sink rate measurements
counter = 1;


% Extract only sink rate and TAS when sink rate is negative
for i=1:fnl % Analyzing all samples
        if( Sink_real(i) < 0 )
                TAS_SR_Points_real(1,counter) = Vel_real(i);
                TAS_SR_Points_real(2,counter) = Sink_real(i);
                counter = counter + 1;
        end
end

% Get polynomial based on linear least squares fit from selected data
polynomial_Vel_real = polyfit(TAS_SR_Points_real(1,:),TAS_SR_Points_real(2,:),2);

% Get the curve with the polynomial obtained
SR_fitted_real = polyval(polynomial_Vel_real,20:0.2:60);


% Plot curve approximated with polynomial
figure()
plot(20:0.2:60,SR_fitted_real,'b')
axis ([15 60 -4.5 1])
grid on
hold on
xlabel('True Air Speed (m/s)')
ylabel('Sink Rate (m/s)')
title('Sink Polar plot')


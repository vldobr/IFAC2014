
% Evaluate values of TAS with the polynomial obtained from RLLS
RLLS_polynomial_last = RLLS_polynomial(:,:,end)';
a = RLLS_polynomial_last(1);
b = RLLS_polynomial_last(2);
c = RLLS_polynomial_last(3);

SR_fitted_RLLS = polyval(RLLS_polynomial_last,TSA_Range);

% Plot figure with the approximated curve from RLLS
figure1 = figure('Color',[1 1 1]);
plot(15:0.2:60,SR_fitted_RLLS,'--k','LineWidth',2)
axis ([0 60 -4.5 0])
grid on
hold on
xlabel('True Air Speed (m/s)')
ylabel('Sink Rate (m/s)')
title('Sink Polar plot using online RLS')


% Adding the minimum sink rate
Minimum_SR = max(SR_fitted_RLLS); % MSR
MSR_index = find(SR_fitted_RLLS == Minimum_SR);
plot(TSA_Range(MSR_index),SR_fitted_RLLS(MSR_index),'ko','MarkerSize',10)
% plot([0,TSA_Range(MSR_index)],[0,TSA_Range(MSR_index)],'-k')
% plot([TSA_Range(MSR_index),TSA_Range(MSR_index)],[SR_fitted_RLLS(MSR_index),-22],'k')
% plot([TSA_Range(MSR_index),0],[SR_fitted_RLLS(MSR_index),SR_fitted_RLLS(MSR_index)],'k')
% text(35,-2.75,['Optimum speed = ', num2str(TSA_Range(MSR_index)),' m/s'])
% text(35,-3.25,['Minimum Sink Rate = ', num2str(-Minimum_SR),' m/s'])


% Adding the optimal gliding speed
plot(sqrt(c/a),b*sqrt(c/a) + 2*c,'dk','MarkerSize',10)
plot([0,sqrt(c/a)],[0,b*sqrt(c/a)+2*c],'k')

% Add legends
L = legend('$\dot{h}$','$V_{smin}$','$V_{cc}$',1);
set(L,'Interpreter','latex')



% plot(sqrt(RLLS_polynomial_last(3)/RLLS_polynomial_last(1)),0,'pr')
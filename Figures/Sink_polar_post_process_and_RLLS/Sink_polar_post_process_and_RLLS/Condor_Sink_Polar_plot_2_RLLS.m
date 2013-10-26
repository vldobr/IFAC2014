% Evaluate values of TAS with the polynomial obtained from RLLS
SR_fitted_RLLS = polyval(RLLS_polynomial(:,:,end)',20:0.2:60);

% Plot figure with the approximated curve from RLLS
plot(20:0.2:60,SR_fitted_RLLS,'--r')
legend('Sink Polar post-process','Sink Polar RLLS',0)





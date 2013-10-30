close all
clear all
clc

load('Data_logger_8_oct_2013.mat')

%% Plot of energy

% Find energy bias due to current in solar panel
Current_panel2_bias = (13036-14909)/10;

% Create white figure
figure1 = figure('Color',[1 1 1]);

% Make correction to bias in solar panel
Real_Energy_panel2_mWs = 0;
Real_Energy_panel2_mWh = 0;
for i= 1:length(Voltage_panel_mV)
    Real_Energy_panel2_mWs(i) = (Voltage_panel_mV(i)*Current_panel2_mA(i)/1000 - Current_panel2_bias)*Time_increment_ms(i)/1000 + Real_Energy_panel2_mWs(end);
    Real_Energy_panel2_mWh(i) = Real_Energy_panel2_mWs(i)/3600;
end

% Plot energy in check points
plot(Cumulated_time_ms/1000/3600,Real_Energy_panel2_mWh,'-k','Linewidth',1.5)
hold on
grid on
plot(Cumulated_time_ms/1000/3600,Energy_pack1_mWh,'--k','Linewidth',1.5)
plot(Cumulated_time_ms/1000/3600,Energy_pack2_mWh,'-.k','Linewidth',1.5)
plot(Cumulated_time_ms/1000/3600,Energy_pack3_mWh,':k','Linewidth',1.5)
plot(Cumulated_time_ms/1000/3600,Energy_load_mWh,'-r','Linewidth',1.5)
% plot(Cumulated_time_ms/1000/3600,Energy_pack1_mWh + Energy_pack2_mWh + Energy_pack3_mWh - Energy_load_mWh - Energy_panel2_mWh,'--c')
% plot(Cumulated_time_ms/1000/3600,Energy_pack1_mWh + Energy_pack2_mWh + Energy_pack3_mWh - Energy_load_mWh,'-k')


set(gca,'FontSize',12)
xlabel('Time, hours','FontSize',12)
ylabel('Energy, mWh','FontSize',12)
% title('Electrical Energy Management System TaLEUAS')


%Add legends
leg = legend('Solar panel','Pack 1','Pack 2','Pack 3','Load',0);
set(leg,'FontSize',12)
legend('boxoff')

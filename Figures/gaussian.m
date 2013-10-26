clear
close
mu = [0 0];
Sigma = [.25 0.3; 0.3 1.55];
x1 = -3:.2:3; x2 = -3:.2:3;

% Create figure
figure1 = figure('Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1,'YTick',zeros(1,0),'XTickLabel',{},...
    'XTick',zeros(1,0),...
    'CLim',[-0.207202087183489 0.414404174366977]);
%% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[-2.5 2.5]);
%% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-2.5 2.5]);
%% Uncomment the following line to preserve the Z-limits of the axes
% zlim(axes1,[0 0.4]);
view(axes1,[90 90]);
grid(axes1,'on');
hold(axes1,'all');
colormap(cool);

[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-3 3 -3 3 0 .4])
xlabel('x'); ylabel('y'); zlabel('Vertical velocity')
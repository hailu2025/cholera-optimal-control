%% MATLAB Code for Global Sensitivity Analysis Figure (Figure 2)
% This code generates the PRCC sensitivity plot

clear; close all; clc;

%% Data from manuscript
parameters = {
    '\kappa (Symptomatic rate)';
    'r_p (Pathogenic growth rate)';
    '\alpha_p (Environmental infectivity)';
    '\tau_p (Symptomatic shedding)';
    '\phi (Competition coefficient)';
    '\eta (Vaccine efficacy)';
    '\beta (Human transmission)';
    '\mu_p (Pathogenic decay)';
    '\psi (Vaccination rate)';
    '\epsilon_p (Asymptomatic shedding)';
    '\iota (Asymptomatic trans.)'
};

PRCC = [0.92, 0.88, 0.85, 0.79, -0.75, -0.70, 0.41, -0.55, -0.48, 0.38, 0.32];

%% Create figure
figure('Position', [100, 100, 800, 500]);

% Create color scheme
colors = zeros(length(PRCC), 3);
for i = 1:length(PRCC)
    if PRCC(i) > 0
        colors(i,:) = [0.8, 0.2, 0.2]; % Red
    else
        colors(i,:) = [0.2, 0.4, 0.8]; % Blue
    end
end

% Plot
hb = barh(PRCC);
hb.FaceColor = 'flat';
hb.CData = colors;
hb.EdgeColor = 'k';
hb.LineWidth = 1;

% Formatting
set(gca, 'YTick', 1:length(parameters), ...
         'YTickLabel', parameters, ...
         'FontSize', 10, ...
         'FontName', 'Arial');
xlabel('Partial Rank Correlation Coefficient (PRCC)', 'FontSize', 12, 'FontWeight', 'bold');
title('Global Sensitivity Analysis of Basic Reproduction Number R_0', 'FontSize', 14);
xlim([-1, 1]);
grid on;

% Add value labels
for i = 1:length(PRCC)
    if PRCC(i) >= 0
        text(PRCC(i)+0.03, i, sprintf('%.2f', PRCC(i)), ...
            'FontSize', 9, 'HorizontalAlignment', 'left');
    else
        text(PRCC(i)-0.03, i, sprintf('%.2f', PRCC(i)), ...
            'FontSize', 9, 'HorizontalAlignment', 'right');
    end
end

% Zero line
line([0 0], [0 length(PRCC)+1], 'Color', 'k', 'LineWidth', 1.5);

% Save
print('Figure2_Sensitivity.png', '-dpng', '-r300');
fprintf('Figure saved as Figure2_Sensitivity.png\n');
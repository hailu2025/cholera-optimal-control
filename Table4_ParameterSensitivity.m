%% MATLAB Code for Table 4: Parameter Sensitivity Analysis
clear; close all; clc;

%% Data from manuscript
beta = [0.1; 0.2; 0.3];
alpha_p = [0.3; 0.5; 0.5];
phi = [1.2; 1.2; 0.6];
peak_det = [15.3; 52.7; 182.4];
peak_sto = [14.8; 50.3; 175.2];
time_peak = [42.1; 28.4; 17.8];

%% Display table
fprintf('==================================================================\n');
fprintf('       TABLE 4: Sensitivity to Transmission Parameters\n');
fprintf('==================================================================\n');
fprintf('%-6s %-6s %-6s %-15s %-15s %-15s\n', ...
    '\beta', '\alpha_p', '\phi', 'Peak (Det)', 'Peak (Sto)', 'Time to Peak');
fprintf('%-6s %-6s %-6s %-15s %-15s %-15s\n', ...
    '---', '-----', '---', '---------', '---------', '------------');

for i = 1:3
    fprintf('%-6.1f %-6.1f %-6.1f %-15.1f %-15.1f %-15.1f\n', ...
        beta(i), alpha_p(i), phi(i), ...
        peak_det(i), peak_sto(i), time_peak(i));
end

%% Calculate percentage differences
diff_percent = ((peak_det - peak_sto) ./ peak_det) * 100;

fprintf('\nPercentage differences (Deterministic vs Stochastic):\n');
for i = 1:3
    fprintf('Scenario %d: %.1f%%\n', i, diff_percent(i));
end

%% Visualize
figure('Position', [100, 100, 900, 400]);

% Plot 1: Parameter effects
subplot(1,2,1);
x = 1:3;
plot(x, peak_det, 'b-o', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
plot(x, peak_sto, 'r-s', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Scenario');
ylabel('Peak Infections');
legend('Deterministic', 'Stochastic', 'Location', 'northwest');
title('(A) Peak Infections Comparison');
grid on;
set(gca, 'XTick', 1:3, 'XTickLabel', {'Low', 'Medium', 'High'});

% Plot 2: Parameter combinations
subplot(1,2,2);
scatter3(beta, alpha_p, phi, 200, peak_det, 'filled');
xlabel('\beta');
ylabel('\alpha_p');
zlabel('\phi');
title('(B) Parameter Space');
colorbar;
grid on;

%% Save to CSV
scenarios = {'Low Transmission'; 'Medium Transmission'; 'High Transmission'};
T = table(scenarios, beta, alpha_p, phi, peak_det, peak_sto, time_peak, diff_percent, ...
    'VariableNames', {'Scenario', 'Beta', 'Alpha_p', 'Phi', ...
    'Peak_Det', 'Peak_Sto', 'TimeToPeak', 'PercentDiff'});
writetable(T, 'Table4_ParameterSensitivity.csv');
fprintf('\nData saved to Table4_ParameterSensitivity.csv\n');
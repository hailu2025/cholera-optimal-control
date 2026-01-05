%% MATLAB Code for Table 5: Deterministic vs Stochastic Comparison
clear; close all; clc;

%% Data from manuscript
scenarios = {
    'Low Transmission (R_0^D=0.8)';
    'Moderate Transmission (R_0^D=1.5)';
    'High Transmission (R_0^D=3.2)'
};

R0_D = [0.8; 1.5; 3.2];
peak_det = [0; 52.7; 146.5];
peak_sto = [0.3; 48.9; 142.1];
ext_prob = [0.92; 0.15; 0.02];

%% Display table
fprintf('==============================================================\n');
fprintf('  TABLE 5: Deterministic vs Stochastic Comparison\n');
fprintf('==============================================================\n');
fprintf('%-35s %-10s %-12s %-12s %-15s\n', ...
    'Scenario', 'R_0^D', 'Peak (Det)', 'Peak (Sto)', 'Ext. Prob.');
fprintf('%-35s %-10s %-12s %-12s %-15s\n', ...
    '-------', '-----', '----------', '----------', '---------');

for i = 1:3
    fprintf('%-35s %-10.1f %-12.1f %-12.1f %-15.2f\n', ...
        scenarios{i}, R0_D(i), peak_det(i), peak_sto(i), ext_prob(i));
end

%% Calculate reductions
reductions = ((peak_det - peak_sto) ./ peak_det) * 100;
reductions(1) = 0; % Avoid NaN for zero peak

fprintf('\nSummary:\n');
fprintf('Average stochastic reduction: %.1f%%\n', mean(reductions(2:3)));
fprintf('Extinction probability when R_0^D < 1: %.0f%%\n', ext_prob(1)*100);
fprintf('Extinction probability when R_0^D > 3: %.0f%%\n', ext_prob(3)*100);

%% Visualize
figure('Position', [100, 100, 1000, 400]);

% Plot 1: Peak comparison
subplot(1,2,1);
bar([peak_det, peak_sto]);
set(gca, 'XTickLabel', {'Low', 'Moderate', 'High'});
ylabel('Peak Infections');
legend('Deterministic', 'Stochastic', 'Location', 'northwest');
title('(A) Peak Infection Comparison');
grid on;

% Plot 2: Extinction probability vs R0
subplot(1,2,2);
plot(R0_D, ext_prob, 'b-o', 'LineWidth', 2, 'MarkerSize', 10);
xlabel('Deterministic R_0^D');
ylabel('Extinction Probability');
title('(B) Stochastic Extinction');
ylim([0, 1]);
grid on;

% Add theoretical curve
hold on;
R0_range = linspace(0.5, 4, 100);
P_ext_theory = exp(-2*(R0_range-1));
plot(R0_range, P_ext_theory, 'r--', 'LineWidth', 1.5);
legend('Simulation', 'Theoretical', 'Location', 'northeast');

%% Save to CSV
T = table(scenarios, R0_D, peak_det, peak_sto, ext_prob, reductions, ...
    'VariableNames', {'Scenario', 'R0_Deterministic', 'Peak_Det', ...
    'Peak_Sto', 'Extinction_Probability', 'Reduction_Percent'});
writetable(T, 'Table5_DeterministicStochastic.csv');
fprintf('\nData saved to Table5_DeterministicStochastic.csv\n');
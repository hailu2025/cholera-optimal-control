%% MATLAB Code for Table 3: Control Strategies Effectiveness
clear; close all; clc;

%% Data from manuscript
strategies = {
    'No control';
    'Vaccination only';
    'Sanitation only';
    'Treatment only';
    'Combined'
};

peak_infections = [146.5; 98.3; 87.6; 76.4; 18.7];
time_to_peak = [19.7; 25.2; 28.4; 30.1; 51.2];
total_cost = [0; 320; 285; 295; 810];

%% Display table
fprintf('==========================================================\n');
fprintf('          TABLE 3: Control Strategies Comparison\n');
fprintf('==========================================================\n');
fprintf('%-20s %-15s %-15s %-10s\n', ...
    'Strategy', 'Peak Infections', 'Time to Peak', 'Cost');
fprintf('%-20s %-15s %-15s %-10s\n', ...
    '-------', '--------------', '-------------', '----');

for i = 1:length(strategies)
    fprintf('%-20s %-15.1f %-15.1f %-10.0f\n', ...
        strategies{i}, ...
        peak_infections(i), ...
        time_to_peak(i), ...
        total_cost(i));
end

%% Plot results
figure('Position', [100, 100, 1200, 400]);

% Plot 1: Peak infections
subplot(1,3,1);
bar(peak_infections);
set(gca, 'XTickLabel', strategies, 'XTickLabelRotation', 45);
ylabel('Peak Infections');
title('(A) Peak Infections');
grid on;

% Plot 2: Time to peak
subplot(1,3,2);
bar(time_to_peak);
set(gca, 'XTickLabel', strategies, 'XTickLabelRotation', 45);
ylabel('Time to Peak (days)');
title('(B) Epidemic Delay');
grid on;

% Plot 3: Cost
subplot(1,3,3);
bar(total_cost);
set(gca, 'XTickLabel', strategies, 'XTickLabelRotation', 45);
ylabel('Total Cost');
title('(C) Intervention Cost');
grid on;

%% Save data to CSV
data = table(strategies, peak_infections, time_to_peak, total_cost, ...
    'VariableNames', {'Strategy', 'PeakInfections', 'TimeToPeak', 'Cost'});
writetable(data, 'Table3_ControlStrategies.csv');
fprintf('\nData saved to Table3_ControlStrategies.csv\n');

%% Extreme Temperature vs. Time

figure
plot(temphigh);
xlabel('Time (Months Since Jan. 1980)');
ylabel('Proportion of Region with Extreme Temperature');
title('Extreme Temperature vs. Time');


figure
plot(temphigh(6:12:end));
xlabel('Years Since June 1980');
ylabel('Proportion of Region with Extreme Temperature');
title('Extreme Temperature vs. Time');
subtitle('June');

%% Expected Extreme

ms = [1 4 7 10];
ys = years(end-window:end);

vector = templow;

for mi = 1:length(ms)
    m = ms(mi); ts = sort([time(ys, prev(m)) time(ys, m) time(ys, next(m))]);
    eprop(mi) = mean(vector(ts));
    figure
    ecdf(vector(ts), 'function', 'survivor');
    xlabel('Proportion of Region')
    ylabel('Probability of Exceedance');
    title({ sprintf('Extreme Low Temperature: %s', months{m}),...
            sprintf('Expected Proportion: %0.1f%%', 100*eprop(mi)) });
end
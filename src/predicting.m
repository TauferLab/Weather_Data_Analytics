window = 5;
forecast = 6;
vector = templow;


ms = [1 4 7 10];
ys = years(end-window:end);

for m = ms
    ts = sort([time(ys, prev(m)) time(ys, m) time(ys, next(m))]);
    figure
    ecdf(vector(ts));
    xlabel('Proportion of Region');
    ylabel('P(X < Proportion)');
    title(sprintf('ECDF Model for %s (%d - %d)', months{m}, ys(end)+1, ys(end)+forecast), 'FontSize', 16);
end
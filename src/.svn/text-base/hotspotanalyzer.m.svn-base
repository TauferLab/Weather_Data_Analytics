%% Process Data
% Pretty Cheap - Easy to Recompute


lowT = zeros(1,12);
highT = zeros(1,12);
lowS = zeros(1,12);
highS = zeros(1,12);
lowP = zeros(1,12);
highP = zeros(1,12);

box = [];
group = [];

for m = 1:12
   ts = time(years, m);
   T = vertcat(temp{ts});
   S = vertcat(srad{ts});
   P = vertcat(prcp{ts});
   
   lowT(m) = prctile(T,lowpctl);
   highT(m) = prctile(T,highpctl);
   lowS(m) = prctile(S,lowpctl);
   highS(m) = prctile(S,highpctl);
   lowP(m) = prctile(P,lowpctl);
   highP(m) = prctile(P,highpctl);
end

%% Plotting

figure 
plot(1:12, highT, 'r-'), hold on;
plot(1:12, lowT, 'b-')
xlabel('Month')
ylabel('Extreme Temperature Threshold')
title('Time vs. Threshold')
legend('High Threshold', 'Low Threshold');

figure 
plot(1:12, highS, 'r-'), hold on;
plot(1:12, lowS, 'b-')
xlabel('Month')
ylabel('Extreme Solar Radiation Threshold')
title('Time vs. Threshold')
legend('High Threshold', 'Low Threshold');

figure 
plot(1:12, highP, 'r-'), hold on;
plot(1:12, lowP, 'b-')
xlabel('Month')
ylabel('Extreme Precipitation Threshold')
title('Time vs. Threshold')
legend('High Threshold', 'Low Threshold');
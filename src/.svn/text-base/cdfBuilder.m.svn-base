%% CDF Analysis

%% Collecting data and building CDF

templow =  zeros(totalTime, 1);
temphigh = zeros(totalTime, 1);
prcplow =  zeros(totalTime, 1);
prcphigh = zeros(totalTime, 1);
sradlow =  zeros(totalTime, 1);
sradhigh = zeros(totalTime, 1);


for y = years
    for m = 1:12
        t = time(y,m);
        T = temp{t};
        S = srad{t};
        P = prcp{t};
        
        templow(t) = mean(T <= lowT(m));
        temphigh(t) = mean(T >= highT(m));
        prcplow(t) = mean(P <= lowP(m));
        prcphigh(t) = mean(P >= highP(m));
        sradlow(t) = mean(S <= lowS(m));
        sradhigh(t) = mean(S >= highS(m));
    end
end

%% Plotting and Analysis

% Group data by month

prev = [12 1:11];
next = [2:12 1];
validation = 12; % Number of years to reserve for validation

for forecast = 1:6
    for window = 1:8
        clear tl th sl sh pl ph
        for y = years(1:end-window-forecast+1-validation)
            for m = 1:12
                % Benchmark
                ys = y:y+window-1;
                ts = sort([time(ys,prev(m)), time(ys,m), time(ys,next(m))]);

                % Validation
                ys2 = y+window:y+window+forecast-1;
                ts2 = time(ys2,m);
                %ts2 = sort([time(ys2,prev(m)), time(ys2,m), time(ys2,next(m))]);

                [H1, P1] = kstest2(templow(ts), templow(ts2)); % 0 = not failure
                [H2, P2] = kstest2(temphigh(ts), temphigh(ts2));
                tl(y-years(1)+1,m) = ~H1; 
                th(y-years(1)+1,m) = ~H2;    
                
                [H1, P1] = kstest2(sradlow(ts), sradlow(ts2)); % 0 = not failure
                [H2, P2] = kstest2(sradhigh(ts), sradhigh(ts2));
                sl(y-years(1)+1,m) = ~H1; 
                sh(y-years(1)+1,m) = ~H2;  
                                
                [H1, P1] = kstest2(prcplow(ts), prcplow(ts2)); % 0 = not failure
                [H2, P2] = kstest2(prcphigh(ts), prcphigh(ts2));
                pl(y-years(1)+1,m) = ~H1; 
                ph(y-years(1)+1,m) = ~H2;
            end
        end
        lowThits(window, forecast) = mean(tl(:));
        highThits(window, forecast) = mean(th(:));  
        lowShits(window, forecast) = mean(sl(:));
        highShits(window, forecast) = mean(sh(:));  
        lowPhits(window, forecast) = mean(pl(:));
        highPhits(window, forecast) = mean(ph(:));  
        
    end
end

fprintf('Plotting + Analysis Complete\n');
%% Configuration File
% What you need to use these scripts:
% Filepath to shape file
% Filepath template to tiff files
% Filter for region within shape file
% Range of years for which you have tiff files

cd(fileparts(mfilename('fullpath')))

shapepath = '../data/metadata/nalcmsmx05gw.shp';
temppath = '../data/temp/tmax_avg_%d_%02d';
prcppath = '../data/prcp/prcp_ttl_%d_%02d';
sradpath = '../data/srad/srad_avg_%d_%02d';

filter = 'Matorral tropical o subtropical';

years = 1980:2013;  
months = { 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' };
                    
lowpctl = 5;
highpctl = 95;

time = @(y, m) (y - years(1))*12 + m; %To index into array

totalTime = 12*length(years);
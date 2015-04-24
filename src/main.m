%% Main Script
% Written by Ryan McKenna
% Extreme weather and temperature analysis
% General arameters for directory structure and regions of interest

config 
fprintf('Configuration Complete\n');


%% Load Data

%loadData % load data from SHP and tiff files
load('../INPUT/test.mat'); % Pre-processed matlab data
fprintf('Data Loaded Successfully\n');

%% HotspotAnalyzer
% Processes data for specified region
% Pools data fore each month, for example (Jan 01, Jan 02, Jan 03, ... Jan 10) 
% and computes the distribution of the data 

hotspotanalyzer

%% cdfBuilder
% Build the CDF

cdfBuilder
fprintf('Analysis Complete\n');

%% validation
validation_prediction

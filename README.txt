This README file describes the contents of the climate data analysis software.
A detailed description of this framework can be obtained from: *cite*.
NOTE: This version of the software has been tailored for the Matorral tropical or
subtropical region of Mexico; as described in *cite*. Please check this repository
periodically for updates. 

* MAIN DIRECTORY STRUCTURE*

Climate Data Analysis Framework
|
|_Input (contains three .mat inputs, namely atlantic_region.mat, entire_region_data.mat, and pacific_data.mat,
|         for the framework corresponding to the Matorral region.)
|_ src (contains the src files for the framework)

*FOLDER DESCRIPTION*

Input -- This folder contains three .mat files that are used as input by the framework. 
Using GeoTiff and shapefile, we extracted temperature, precipitation, and solar radiation
data for the Matorral sub-region of Mexico. Specifically, atlantic_region.mat contains
climate data for regions closer to atlantic, pacific_data.mat contains climate data
for regions closer to Pacific, and entire_region_data.mat contains climate data for
the entire Matorral region. The framework is currently tuned to work with the entire Matorral region.

src -- This folder contains a collection of matlab files that make up the framework. A description 
of its contents is as follows in the next section.

*SOURCE DESCRIPTION*

src
|
|_main.m
    |
    |_config.m
	|
	|_loadData.m
	|
	|_hotspotanalyzer.m
	|
	|_cdfBuilder.m
	|
	|_validation_prediction.m

1. main.m is the top level file. It invokes config, loadData, hotspotanalyzer, cdfBuilder, and validation_prediction
matlab scripts in order.

2. config.m sets directory paths to data and initializes variables relevant to analysis.

3. loadData.m implements the 'feature extraction mask' of the framework and extracts climate data for the region of
interest. Currently, it is commented out as the framework directly accepts pre-processed MAT files.

4. hotspotanalyzer.m implements the 'extreme-event classifier' of the framework.

5. cdfBuilder.m implements the 'cumulative distribution function' stage.

6. validation_prediction.m performs framework validation and prediction as described in the *cite*.

*How to run the analysis?*

Given that you are using the directory structure as supplied, just hit run on the main.m and software will
produce all of the results! 
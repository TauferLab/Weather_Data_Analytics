%% Read Data
% Expensive - don't recompute unless necessary

% Here we optimize the IO portion by noting that every tiff file has the
% same metadata and projection object


%% Load  Data


if(~exist('SHP', 'var'))
    SHP = shaperead(shapepath, 'UseGeoCoords', true, ...
                        'Selector', { @(s) strcmp(s,filter), 'NOM_CLASE' });
end

I = indices(sprintf(temppath, years(1), 1), SHP);

temp = cell(12*length(years),1);
prcp = cell(12*length(years),1);
srad = cell(12*length(years),1);

yearsA = repmat(years, 12, 1); yearsA = yearsA(:);
monthsA = repmat((1:12)', length(years), 1);

for t = 1:12*length(years)
    y = yearsA(t); m = monthsA(t);
    T = geotiffread(sprintf(temppath, y, m));
    P = geotiffread(sprintf(prcppath, y, m));
    S = geotiffread(sprintf(sradpath, y, m));
    T = T(I); P = P(I); S = S(I);

    temp{t} = T(T~=-9999);
    prcp{t} = P(P~=-9999);
    srad{t} = S(S~=-9999);
    fprintf('Processed %d-%d\n', m, y);
end
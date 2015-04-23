function [i, j] = geo2ind(proj, lat, lon)
% Transforms geographic coordinates into matrix indices
% Consumes:
% proj: An info object for the GeoTiff file (e.g. proj = geotiffinfo(...))
% lat: A vector containing latitudes
% lon: A vector containing longitudes

[x, y] = projfwd(proj, lat, lon);

[j, i] = proj.SpatialRef.worldToIntrinsic(x,y);
i = round(i); j = round(j);
end


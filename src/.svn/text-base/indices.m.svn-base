function [ I ] = indices( tiff, S )
%match Matches a GeoTiff file with the corresponding SHP object
% Consumes:
%   tiff: Name of tiff file to load
%   S:    Shape struct with locations to extract
% Produces:
%   I: sparse matrix of indices from shape file
% Note: This function has a dependency on geo2ind
% Note: This function is supposed to replace match by doing less
% recomputation
proj = geotiffinfo(tiff);
A = geotiffread(tiff);

lat = [S.Lat];
lon = [S.Lon];

[i, j] = geo2ind(proj, lat(~isnan(lat)), lon(~isnan(lat)));

ij = unique([i' j'], 'rows');

figure
plot(ij(:,1),ij(:,2),'.', 'markers', 4), hold on
view([90 90]);
[xs,ys] = ginput;
plot([xs; xs(1)], [ys; ys(1)], 'r-', 'LineWidth', 2);

ij = ij(inpolygon(ij(:,1), ij(:,2), xs, ys), [1 2]);

figure
plot(ij(:,1),ij(:,2),'.', 'markers', 4);
view([90 90]);

I = sparse(ij(:,1), ij(:,2), true, size(A,1), size(A,2));
end


function [  ] = jointCDF( X,Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% Data (example):
%     X = randn(1,1e5); % random variables.
%     Y = randn(1,1e5);

    x_axis = 0:1:3; % Define edges of bins for x axis. Column vector
    y_axis = 0:1:3; % Same for y axis

    % Compute corners of 2D-bins:
    [x_mesh_upper,y_mesh_upper] = meshgrid(x_axis(2:end),y_axis(2:end));
    [x_mesh_lower,y_mesh_lower] = meshgrid(x_axis(1:end-1),y_axis(1:end-1));

    % Compute centers of 1D-bins:
    x_centers = (x_axis(2:end)+x_axis(1:end-1))/2;
    y_centers = (y_axis(2:end)+y_axis(1:end-1))/2;

    % Compute pdf:
    pdf = mean( bsxfun(@le, X(:), x_mesh_upper(:).') ...
        & bsxfun(@gt, X(:), x_mesh_lower(:).') ...
        & bsxfun(@le, Y(:), y_mesh_upper(:).') ...
        & bsxfun(@gt, Y(:), y_mesh_lower(:).') );
    pdf = reshape(pdf,length(x_axis)-1,length(y_axis)-1); % pdf values at the
    % grid points defined by x_centers, y_centers
    pdf = pdf ./ (y_mesh_upper-y_mesh_lower) ./ (x_mesh_upper-x_mesh_lower);
    % normalize pdf to unit integral

    % Compute cdf:
    cdf = mean( bsxfun(@le, X(:), x_mesh_upper(:).') ...
        & bsxfun(@le, Y(:), y_mesh_upper(:).') );
    cdf = reshape(cdf,length(x_axis)-1,length(y_axis)-1);

    % Plot pdf
    figure
    imagesc(x_centers,y_centers,pdf)
    axis xy
    axis equal
    colorbar
    title 'pdf'

    % Plot cdf
    figure
    imagesc(x_centers,y_centers,cdf)
    axis xy
    axis equal
    colorbar
    title 'cdf'

end


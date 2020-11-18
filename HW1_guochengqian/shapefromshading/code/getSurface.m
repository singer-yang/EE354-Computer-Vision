function  heightMap = getSurface(surfaceNormals)
% GETSURFACE computes the surface depth from normals
%   HEIGHTMAP = GETSURFACE(SURFACENORMALS, IMAGESIZE) computes
%   HEIGHTMAP from the SURFACENORMALS using the integration method in 
%   Algorithm 2.1 in the book. 
%  
% Input:
%   SURFACENORMALS: height x width x 3 array of unit surface normals
%
% Output:
%   HEIGHTMAP: height map of object

%%% implement this %%%
[h, w, c] = size(surfaceNormals);
p = surfaceNormals(:, :, 1) ./ surfaceNormals(:, :, 3);
q = surfaceNormals(:, :, 2) ./ surfaceNormals(:, :, 3);
heightMap = zeros(h, w);
%  first column
for i = 2:h
    heightMap(i, 1) = heightMap(i-1, 1) + q(i, 1);
end

% other columns
for j = 2:w
    heightMap(:, j) = heightMap(:, j-1) + p(:, j);
end


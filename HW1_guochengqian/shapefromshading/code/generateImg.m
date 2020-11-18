function  img = generateImg(albedoImage, surfaceNormals, lightDir)
% Use the albedo and normals you computed to 
% generate the image of each surface for

% %  
% Input:
%   albedoImage
%   SURFACENORMALS: height x width x 3 array of unit surface normals
%
% Output:
%   HEIGHTMAP: height map of object

%%% implement this %%%
[h, w] = size(albedoImage);
x = reshape(albedoImage .* surfaceNormals, [], 3)';
img = reshape(lightDir*x, h, w);



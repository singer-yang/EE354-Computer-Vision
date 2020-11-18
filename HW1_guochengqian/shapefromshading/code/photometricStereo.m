function [albedoImage, surfaceNormals] = photometricStereo(imArray, lightDirs)
% PHOTOMETRICSTEREO compute intrinsic image decomposition from images
%   [ALBEDOIMAGE, SURFACENORMALS] = PHOTOMETRICSTEREO(IMARRAY, LIGHTDIRS)
%   comptutes the ALBEDOIMAGE and SURFACENORMALS from an array of images
%   with their lighting directions. The surface is assumed to be perfectly
%   lambertian so that the measured intensity is proportional to the albedo
%   times the dot product between the surface normal and lighting
%   direction. 
%
%   Input:
%       IMARRAY - [h w n] array of images, i.e., n images of size [h w]
%       LIGHTDIRS - [n 3] array of unit normals for the light directions
%
%   Output:
%        ALBEDOIMAGE - [h w] image specifying albedos
%        SURFACENORMALS - [h w 3] array of unit normals for each pixel
%
% Acknowledgement: Based on a similar homework by Lana Lazebnik


%%% implement this %% 
[h, w, n] = size(imArray); 

B = reshape(imArray, [h*w, n])';

X = inv(lightDirs' * lightDirs) *(lightDirs') * B;
X = reshape(X', [h*w, 3]);

X_norm = vecnorm(X, 2, 2);
albedoImage = reshape(X_norm, [h, w]);
albedoImage = mat2gray(albedoImage); % normlize to (0, 1)

surfaceNormals = X./X_norm;
surfaceNormals = reshape(surfaceNormals, [h, w, 3]);

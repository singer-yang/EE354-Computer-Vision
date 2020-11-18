% Evaluation code for photometric stereo
% 
% Your goal is to implement the functions photometricStereo() and 
% getSurface() to estimate the albedo and shape of
% the objects in the scene from multiple images. 
%
% Start with setting subjectName='debug' which sets up a toy scene with
% known albedo and height which you can compare against. After you have a
% good implementation of this part, set the subjectName='yabeB01', etc. to
% run your code against real images of people from the YALEB dataset. 
% Credits: The homework is adapted from a similar one developed by
% Shvetlana Lazebnik (UNC/UIUC)

clear; clc; close all;
dataDir     = fullfile('..','data'); % Path to your data directory
subjectName = 'yaleB05'; % circle, yaleB01, yaleB02, yaleB05, yaleB07
numImages   = 64; % Total images for each surface
writeOutput = true; % If true then the output will be written to file 
outputDir   = fullfile('..','output');
imageDir    = fullfile(dataDir, subjectName);
%% Load images for different viewing conditions
if strcmp(subjectName, 'circle')
    imageSize = 2*[64 64];
    [ambientImage, imArray, lightDirs, trueAlbedo, trueSurfaceNormals, trueHeightMap] = toyExample(imageSize, numImages);
else
    [ambientImage, imArray, lightDirs] = loadFaceImages(imageDir, subjectName, numImages);
end

%% Decompose the scene into normals and albedo
[albedoImage, surfaceNormals] = photometricStereo(imArray, lightDirs);

%% Question 3: 
% Use the albedo and normals you computed to generate the image of each surface for
% three light directions: s 1 = [0 − 1 1] > , s 2 = [0 1 1] > , and s 3 = [1 1 1] > . Plot these
% synthetic images and comment on why they should look like this.
% s1 = [0 -1 1];
% s2 = [0 1 1];
% s3 = [1 1 1];
s1 = [1 0 0];
s2 = [0 1 0];
s3 = [0 0 1];

img1 = generateImg(albedoImage, surfaceNormals, s1);
img2 = generateImg(albedoImage, surfaceNormals, s2);
img3 = generateImg(albedoImage, surfaceNormals, s3);
figure;
subplot(1,3,1)
imshow(img1, []);
title('s1');
subplot(1,3,2)
imshow(img2, []);
title('s2');
subplot(1,3,3)
imshow(img3, []);
title('s3');

%% Compute height from normals by integration along paths
heightMap = getSurface(surfaceNormals);

%% Display the output
displayOutput(albedoImage, heightMap);
% displayOutput(albedoImage, albedoImage);
plotSurfaceNormals(surfaceNormals);
%  surf plot heightMap
displaySurf(heightMap);

%%% Hint: If debugging you can compare your results to this %%%
if strcmp(subjectName, 'circle')
    displayOutput(trueAlbedo, trueHeightMap);
    plotSurfaceNormals(trueSurfaceNormals);
end
%% Optionally write the output
if writeOutput
    if ~exist(outputDir, 'file')
        mkdir(outputDir);
    end
    % Write out the albedo image
    imageName = fullfile(outputDir, sprintf('%s_albedo.jpg', subjectName));
    imwrite(albedoImage, imageName, 'jpg');
    
    % Write out the generated image
    imageName = fullfile(outputDir, sprintf('%s_s1.jpg', subjectName));
    imwrite(img1, imageName, 'jpg');
    imageName = fullfile(outputDir, sprintf('%s_s2.jpg', subjectName));
    imwrite(img2, imageName, 'jpg');
    imageName = fullfile(outputDir, sprintf('%s_s3.jpg', subjectName));
    imwrite(img3, imageName, 'jpg');
    
    % Write out the normals as a color image
    imageName = fullfile(outputDir, sprintf('%s_normals_color.jpg', subjectName));
    imwrite(surfaceNormals, imageName, 'jpg');
    
    % Write out the normals as seperate (x, y, z) components
    imageName = fullfile(outputDir, sprintf('%s_normals_x.jpg', subjectName));
    imwrite(surfaceNormals(:,:,1), imageName, 'jpg');
    
    imageName = fullfile(outputDir, sprintf('%s_normals_y.jpg', subjectName));
    imwrite(surfaceNormals(:,:,2), imageName, 'jpg');

    imageName = fullfile(outputDir, sprintf('%s_normals_z.jpg', subjectName));
    imwrite(surfaceNormals(:,:,3), imageName, 'jpg');
    
    % save obj file. 
    [h, w] = size(albedoImage);
    t = table(repmat('v', h*w, 1),[combvec(1:h,1:w)' heightMap(:) albedoImage(:) albedoImage(:) albedoImage(:)]);
    writetable(t, sprintf('%s_point_clouds.txt', subjectName), 'Delimiter',' ');
    objName = fullfile(outputDir, sprintf('%s_point_clouds.obj', subjectName));
    movefile(sprintf('%s_point_clouds.txt', subjectName),objName);
end
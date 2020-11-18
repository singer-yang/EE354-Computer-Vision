% For Homework 2.3
% image stitching
clc; close all; clear;
% %% load images. 
data_dir = fullfile('.','stitching_images');
img1 = imread(fullfile(data_dir, 'im01.png'));
img2 = imread(fullfile(data_dir, 'im02.png'));
img3 = imread(fullfile(data_dir, 'im03.png'));
img4 = imread(fullfile(data_dir, 'im04.png'));

%% Get homograph 
H21 = get_homography(img2, img1);
H32 = get_homography(img3, img2);
H43 = get_homography(img4, img3);
H31=H21*H32;
H41=H21*H32*H43;

% project transform
tform0 = projective2d(eye(3));
tform21 = projective2d(H21.');
tform31 = projective2d(H31.');
tform41 = projective2d(H41.');
% load('hw03.mat');

%% projective2d.outputLimits
[h, w, ~] = size(img3);
[x_limits,y_limits]=outputLimits(tform41,[1 w],[1 h]);
x_min=min([1;x_limits(:)]); x_max=max([w;x_limits(:)]);
y_min=min([1;y_limits(:)]); y_max=max([h;y_limits(:)]);
new_w=ceil(x_max-x_min);
new_h=ceil(y_max-y_min);

% black other regions. zeros
panorama = zeros(new_h,new_w,3);

xlimits=[x_min x_max];
ylimits=[y_min y_max];
% project each img to img1 coordinate.
panorama_view=imref2d([new_h new_w],xlimits,ylimits); 
%% images stitch 
img1_ = imwarp(img1, tform0, 'OutputView', panorama_view);
mask1 = zeros(new_h,new_w); 
mask1(mean(img1_, 3)>0) = 1; 

img2_ = imwarp(img2, tform21, 'OutputView', panorama_view);
mask2 = zeros(new_h,new_w); 
mask2(mean(img2_, 3)>0) = 1; 

img3_ = imwarp(img3, tform31, 'OutputView', panorama_view);
mask3 = zeros(new_h,new_w); 
mask3(mean(img3_, 3)>0) = 1; 

img4_ = imwarp(img4, tform41, 'OutputView', panorama_view);
mask4 = zeros(new_h,new_w); 
mask4(mean(img4_, 3)>0) = 1; 

% simpy average 
mask = (mask1 + mask2 + mask3 + mask4); 
mask(mask==0) = 1; 
panorama = double(img1_) + double(img2_) + double(img3_) + double(img4_);
panorama = panorama./ mask;

figure
imshow(uint8(panorama));


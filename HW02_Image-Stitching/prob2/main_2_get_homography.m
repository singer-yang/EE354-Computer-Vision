% For Homework 2.2
% get homography

% clear; clc; close all;

%% load images. 
data_dir = fullfile('.','stitching_images');
img1 = imread(fullfile(data_dir, 'im01.png'));
img2 = imread(fullfile(data_dir, 'im02.png'));
img3 = imread(fullfile(data_dir, 'im03.png'));
img4 = imread(fullfile(data_dir, 'im04.png'));

%% Get homograph 
H21 = get_homography(img2, img1)
H32 = get_homography(img3, img2)
H43 = get_homography(img4, img3)

%% Get the transformed imgs.
H31=H21*H32;
H41=H21*H32*H43;

tform21 = projective2d(H21.');
tform32 = projective2d(H32.');
tform43 = projective2d(H43.');
tform31 = projective2d(H31.');
tform41 = projective2d(H41.');

img2_ = imwarp(img2, tform21);
img3_ = imwarp(img3, tform32);
img4_ = imwarp(img4, tform43);
img3_1 = imwarp(img3, tform31);
img4_1 = imwarp(img4, tform41);

figure();
subplot(341); imshow(img1); xlabel('img1','FontSize',20);
subplot(342); imshow(img2); xlabel('img2','FontSize',20);
subplot(343); imshow(img3);xlabel('img3','FontSize',20);
subplot(344); imshow(img4);xlabel('img4','FontSize',20);
subplot(345); imshow(img1);xlabel('img1','FontSize',20);
subplot(346); imshow(img2_);xlabel('img2 to img1','FontSize',20);
subplot(347); imshow(img3_);xlabel('img3 to img2','FontSize',20);
subplot(348); imshow(img4_);xlabel('img4 to img3','FontSize',20);

subplot(349); imshow(img1);xlabel('img1','FontSize',20);
subplot(3,4,10); imshow(img2_);xlabel('img2 to img1','FontSize',20);
subplot(3,4,11); imshow(img3_1);xlabel('img3 to img1','FontSize',20);
subplot(3,4,12); imshow(img4_1);xlabel('img4 to img1','FontSize',20);

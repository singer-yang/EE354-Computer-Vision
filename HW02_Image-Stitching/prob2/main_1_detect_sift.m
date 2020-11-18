% For Homework 2.1 
% sift detection. 

%% load images. 
data_dir = fullfile('.','stitching_images');
img1 = imread(fullfile(data_dir, 'im01.png'));
img2 = imread(fullfile(data_dir, 'im02.png'));

%% SIFT
img_grey1 = im2single(rgb2gray(img1));
img_grey2 = im2single(rgb2gray(img2));
[matches,scores,F1, F2] = cal_sift(img_grey1,img_grey2);

%% show 
figure() ;
imshow(cat(2, img1, img2)) ;

X1 = F1(1:2,matches(1,:)) ;
X2 = F2(1:2,matches(2,:)) ; 
X2(1, :) = X2(1, :) + size(img1, 2);

hold on ;
h = line([X1(1, :); X2(1, :)], [X1(2, :); X2(2, :)]) ;
set(h,'linewidth', 1, 'color', 'r') ;

vl_plotframe(F1(:,matches(1,:))) ;
F2(1,:) = F2(1,:) + size(img1,2) ;
vl_plotframe(F2(:,matches(2,:))) ;
axis image off ;
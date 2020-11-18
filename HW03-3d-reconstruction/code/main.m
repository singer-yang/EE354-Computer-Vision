%% Colored 3D Point Cloud
clear; clc; close all;
% load 
load('../HW03-data/rgbd_pair.mat')
camera=load('Calib_Results_stereo.mat');
K_IR = camera.KK_left;
K_RGB = camera.KK_right;

R = camera.R;
T=camera.T/1000;

%% Question 1: from pixel in IR image to 3D coordinates of points
[H, W] = size(Depth);
[xx,yy] = meshgrid(1:W,1:H);
X_IR = reshape(cat(3, xx, yy), [], 2)';
X_IR_H = [X_IR; ones(1, size(X_IR, 2))]; 

X = reshape(Depth, 1, []).*(inv(K_IR)*X_IR_H);
X = X';
point_cloud = pointCloud(X);
pcshow(point_cloud);

%% Question 2: project 3d to image
N = size(X, 1);
X_H=[X, ones(N, 1)]';
X_RGB = K_RGB*[R T]*X_H;
X_RGB = X_RGB./X_RGB(3, :);
X_RGB = round(X_RGB(1:2, :))';

%% Question 3: assign colors to 3d points 
RGB = double(RGB)/255;
color = zeros(N, 3);

for i = 1:N
    i_x = X_RGB(i, 1);
    i_y = X_RGB(i, 2);
    if i_x>0 && i_x<W &&i_y>0&& i_y<H
        color(i,:) = RGB(i_y, i_x, :);
    end
end

% show point cloud
% point_cloud = pointCloud(X, 'Color', color);
% pcshow(point_cloud);

% % save obj file. 
subjectName = '3d_from_Depth';
t = table(repmat('v', N, 1),[X, color]); % v: vertices
writetable(t, sprintf('%s_point_clouds.txt', subjectName), 'Delimiter',' ');
objName = fullfile('./', sprintf('%s_point_clouds.obj', subjectName));
movefile(sprintf('%s_point_clouds.txt', subjectName),objName);


%% Question 4: project 3d to a new image using sythesized R and T
% X_RGB_new = K_RGB*[R T]*X_H;
X_RGB_new = K_RGB*[R_virtual T_virtual]*X_H;
X_RGB_new = X_RGB_new./X_RGB_new(3, :);
X_RGB_new = round(X_RGB_new(1:2, :))';
RGB_new = zeros(H, W, 3);

for i = 1:N
    i_x = X_RGB_new(i, 1);
    i_y = X_RGB_new(i, 2);
    if i_x>0 && i_x<W &&i_y>0&& i_y<H
        RGB_new(i_y, i_x, :) = color(i, :);
    end 
end
imshow(RGB_new);
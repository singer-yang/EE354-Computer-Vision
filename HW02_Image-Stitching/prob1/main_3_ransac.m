%% Fitting Lines through Points
% Line Fitting RANSAC
clc; close all; clear
data=importdata('data/pts2.txt'); % problem 2 
N = size(data, 1); 
X = [data(:, 1) ones(size(data,1),1)]; Y=data(:, 2);
DATA = [data ones(size(data,1),1)];
%% RANSAC parameters
iters = 1000; % maximum iters
n=2; % minimum number of samples
d=3; % distance threshold 
max_inliers=0;

%% RANSAC
for iter=1:iters 
%     idx = randperm(N,n);
    idx = [77, 81];
    samples = data(idx,:); 

    % LS fitting 
    x = samples(:, 1); y = samples(:, 2);
    A=[x ones(size(samples, 1),1)];
    A_pesudo = inv(A'*A)*A';
    a = A_pesudo * y;
    
    a_ = [a(1);-1;a(2)];
    % count inliers
    deta=abs(DATA*a_/a(1));
    inliers=find(deta<=d);
    num_inliers = length(inliers);

    if num_inliers>=max_inliers
        max_inliers = num_inliers;
        best_inliers = inliers;
    end 
end

fprintf('Get best line model. number of inliers is %d \n', max_inliers);
sample = data(best_inliers,:); 

% LS fitting 
x = sample(:, 1); y = sample(:, 2);
A=[x ones(size(sample, 1),1)];
A_pesudo = inv(A'*A)*A';
a = A_pesudo * y;
Y_pred= X*a;

%% plot the points (x,y) in pts1 and your LS solution (x,y_predict)
figure ;
plot(data(:, 1),Y,'o',data(:, 1),Y_pred,'r')
xlabel('x', 'FontSize', 20);
ylabel('y', 'FontSize', 20);
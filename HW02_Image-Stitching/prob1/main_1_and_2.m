%% Fitting Lines through Points
% Least-Squares Line Fitting
clc; close all; clear

%% Least-Squares Line Fitting
data=importdata('data/pts1.txt'); % problem 1
% data=importdata('data/pts2.txt'); % problem 2 

%% LS
x=data(:,1); y=data(:,2);
% X
A=[x ones(size(data, 1),1)];
A_pesudo = inv(A'*A)*A';
a = A_pesudo * y
y_pred= A*a;

%% plot the points (x,y) in pts1 and your LS solution (x,y_predict)
figure ;
plot(x,y,'o',x,y_pred,'r')
xlabel('x', 'FontSize', 20);
ylabel('y', 'FontSize', 20);


















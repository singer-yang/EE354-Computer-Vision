%%%%%%%
% Evaluation code for  reconstrcution from phase only
% change the initialization to one of "unit, reference, random"
% unit: unit magnitude 
% reference: magnitude equals to the reference img
% random: random magnitude 

clear; clc; close all;
dataDir = fullfile('.','data'); % Path to your data directory
%% load images
img_phase = imread(fullfile(dataDir, 'lake.png')); 
img_amp = imread(fullfile(dataDir, 'house.png')); 
initialization = 'unit'; % unit, reference, random. 
iters = 100;
milestones = [1, 10, 100];

%% construct 2h 2w img
% get phase
[h, w] = size(img_phase);
matrix_phase = zeros(h*2, w*2);
matrix_phase(1:h,1:w) = img_phase;
phase = fft2(matrix_phase); % phase is the one given (use it to reconstruct)

figure; colormap gray; 
set(gcf, 'Position', get(0, 'ScreenSize'));

subplot(141),imshow(img_phase),title('original image');

% get initilized amplitude M
if strcmp(initialization, 'reference')
    matrix_amp = zeros(h*2, w*2);
    matrix_amp(1:h,1:w) = img_amp;
    M = abs(fft2(matrix_amp));
elseif strcmp(initialization, 'random')
    M = rand(h*2, w*2);
elseif strcmp(initialization, 'unit')
    M = ones(h*2, w*2);
else
    error('initialization not supported');
end

%% Iterative update M
no_plot = 0;
for i=1:iters
    % get F_img (reconstructed image in frequency domain) based on phase
    % and amplitude M.
    F_img = M .* exp(1j*angle(phase));
    img = abs(ifft2(F_img)); % reconstruct imgs 
    
    img(h+1:h*2,:)=0; % zero out the padded regions
    img(:,w+1:w*2)=0;
    F_img = fft2(img); % fft
    M = abs(F_img); % get new amplitude
    
    if ismember(i, milestones) % draw reconstructed image
        str = sprintf('iter %d', i);
        no_plot = no_plot +1; 
        subplot(141+no_plot),imshow(mat2gray(img(1:h, 1:w))), title(str);
    end
    
end
print(initialization, '-dpng');

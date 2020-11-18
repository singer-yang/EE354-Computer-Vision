function displaySurf(height)
% NOTE: h x w is the size of the input images
% height: h x w matrix of surface heights

% some cosmetic transformations to make 3D model look better

[hgt, wid] = size(height);
[X,Y] = meshgrid(1:wid, 1:hgt);
figure, surf(X, Y, height);
view(-60,20)
% colormap(gray)
set(gca, 'XDir', 'reverse')
set(gca, 'XTick', []);
set(gca, 'YTick', []);
set(gca, 'ZTick', []);
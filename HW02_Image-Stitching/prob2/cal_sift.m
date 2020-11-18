function [matches,scores,F1, F2] = cal_sift(img1,img2)
%  descriptor, feature with size 128

[F1, D1] = vl_sift(img1); 
[F2, D2] = vl_sift(img2); 
% D: 128 x N. feature 
% Each column of F is a feature frame and has the format [X;Y;S;TH]

[matches, scores] = vl_ubcmatch (D1, D2, 1/0.6667);
end


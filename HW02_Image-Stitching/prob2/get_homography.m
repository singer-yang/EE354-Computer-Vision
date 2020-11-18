function H = get_homography(img1, img2)
    img_grey1 = im2single(rgb2gray(img1));
    img_grey2 = im2single(rgb2gray(img2));
    [matches,~,F1, F2] = cal_sift(img_grey1,img_grey2);
    num_matches = size(matches, 2);

    %% 
    X1 = ones(3,num_matches);
    X1(1:2, :) = F1(1:2, matches(1,:));
    X2 = ones(3,num_matches);
    X2(1:2, :) = F2(1:2, matches(2,:));

    % get_transform T
    T1 = get_transform(X1);
    T2 = get_transform(X2);
    X1_nor = T1 * X1; % normalized x1
    X2_nor = T2 * X2;

    %% RANSAC
    iters = 10000; % maximum iterations
    N = 4;  % samples per iter
    sigma = 1;  

    max_inliers = 0; 
    for iter = 1:iters 
        % 4 random
        idx = randperm(num_matches, N);

        % DLT
        A=[];
        for i = idx
            A = cat(1, A, kron(X1_nor(:,i)', vl_hat(X2_nor(:,i)))); 
        end
        [~,~,V] = svd(A,0);
        H = reshape(V(:,end), [3,3]);
        H = T2 \ H * T1; 

        % project points
        pred_X2 = H * X1;
        pred_X2 = pred_X2 ./ pred_X2(3, :); % Homography coordinates. 
        det = sqrt(sum((pred_X2 - X2) .^ 2, 1));

        inliers = find(det <  sigma);
        num_inlier = length(inliers);

        % choose H with most inliers.
        if num_inlier > max_inliers
            max_inliers = num_inlier;
            best_inliers = inliers;
        end
    end

    % use the inliers to recompute the homograph. 
    % DLT
    fprintf('Get best homography. number of inliers is %d \n', max_inliers);
    A=[];
    X1_inlier=X1(:,best_inliers);
    X2_inlier=X2(:,best_inliers);
    T1=get_transform(X1_inlier);
    T2=get_transform(X2_inlier);

    X1_nor=T1*X1_inlier;
    X2_nor=T2*X2_inlier;

    for i = 1:length(best_inliers)
        A = cat(1, A, kron(X1_nor(:,i)', vl_hat(X2_nor(:,i)))); 
    end
    [~,~,V] = svd(A,0);
    H = reshape(V(:,end), [3,3]);
    H = T2 \ H * T1; % estimated H. 
    
%     %% show sift after ransac
%     figure() ;
%     imshow(cat(2, img1, img2)) ;
% 
%     X2_inlier(1, :) = X2_inlier(1, :) + size(img1, 2);
% 
%     hold on ;
%     h = line([X1_inlier(1, :); X2_inlier(1, :)], [X1_inlier(2, :); X2_inlier(2, :)]) ;
%     set(h,'linewidth', 1, 'color', 'r') ;
% 
%     vl_plotframe(F1(:,matches(1,best_inliers))) ;
%     F2(1,:) = F2(1,:) + size(img1,2) ;
%     vl_plotframe(F2(:,matches(2,best_inliers))) ;
%     axis image off ;
end

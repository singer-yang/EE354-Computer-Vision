function T = get_transform(points)
% points : 3 x N
% normalization. 
    origin = mean(points(1:2,:), 2);
    avg_dist = mean(sqrt(sum((points(1:2,:) - origin).^ 2, 1)));
    s = sqrt(2)/avg_dist;
    T=[s 0 -s*origin(1);0 s -s*origin(2);0 0 1];
end

function [ Dist ] = calc_dist_matrix( x,y )
%CALC_DIST_MATRIX calculates the distance matrix
% vectorization of the code seems to only be better from N > 400 and is
% certainly not a bottleneck (only called once)

n = numel(x);
if (numel(y)~=n), error('input arguments must have equal length'); end


Dist = zeros(n);
for i = 1:n
    for j = 1:n
        Dist(i,j) = sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
    end
end

end
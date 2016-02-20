function [ Dist ] = calc_dist_matrix2( xy )
%CALC_DIST_MATRIX calculates the distance matrix
% vectorization of the code seems to only be better from N > 400 and is
% certainly not a bottleneck (only called once)

n = size(xy,1);

a = reshape(xy,1,n,2);
b = reshape(xy,n,1,2);
Dist = sqrt(sum((a(ones(n,1),:,:) - b(:,ones(n,1),:)).^2,3));

%Dist = zeros(n);
%for i = 1:n
%    for j = 1:n
%        Dist(i,j) = sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
%    end
%end

end
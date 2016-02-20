function [ Dist ] = calc_dist_matrix3( x, y )
%CALC_DIST_MATRIX calculates the distance matrix

Dist = sqrt( bsxfun(@minus, x, x.').^2 + bsxfun(@minus, y, y.').^2 );




%a = reshape(xy,1,n,2);
%b = reshape(xy,n,1,2);
%Dist = sqrt(sum((a(ones(n,1),:,:) - b(:,ones(n,1),:)).^2,3));

%Dist = zeros(n);
%for i = 1:n
%    for j = 1:n
%        Dist(i,j) = sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
%    end
%end


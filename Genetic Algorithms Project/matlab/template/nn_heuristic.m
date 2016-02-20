function [ path ] = nn_heuristic(dist, start)
%NN_HEURISTIC creates a path using Nearest Neighbor heuristic
% Dist is the distance matrix
% start is the city to start from (optional argument)

n = size(dist,1);
path = zeros(1,n);
unvisited = true(1,n);

[~, dind] = sort(dist,2);
dind = dind(:,2:end); %remove indices of eigencity

%choose random starting city
if (nargin < 2 || start > n) start = randi(n);  end
path(1) = start;
unvisited(start) = false;

for k=2:n
    currInd = find( unvisited(dind(path(k-1),:)), 1, 'first' );
    path(k) = dind(path(k-1), currInd);
    unvisited(path(k)) = false;
end
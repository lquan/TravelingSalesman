% calculates the edgemap given the different paths in paths
% (each row given in path representation)
function edgemap = edge_map(parents)
[m,n] = size(parents);
edgemap = zeros(n);

%copy the first and last column for easy loop processing
parents2 = [ parents(:,end) parents parents(:,1) ];

%fill in the edge map
for p=1:m
    for k=2:n+1
        ingoing = parents2(p,k-1);
        curr = parents2(p,k);
        outgoing = parents2(p,k+1);
        
        edgemap(curr, ingoing) = edgemap(curr, ingoing) + 1;
        edgemap(curr, outgoing) = edgemap(curr, outgoing) + 1;
    end
end

if n >= 150 %convert to sparse representation if better performance
    edgemap = sparse(edgemap);
end

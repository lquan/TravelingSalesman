%ERX crossover operator
function NewChrom = ERX_crossover(OldChrom, XOVR)
if nargin < 2, XOVR = NaN; end
nbRows=size(OldChrom,1);

NewChrom = OldChrom;
if rem(nbRows,2)~=0
   nbRows=nbRows-1;
end

for row=1:2:nbRows
    % crossover of the two chromosomes
    % results in 2 offsprings obtained by crossover ERX operator
    if rand<XOVR  % recombine with a given probability
        NewChrom(row,:) = edge_recombination_crossover(OldChrom(row:row+1,:));
        NewChrom(row+1,:)= edge_recombination_crossover(OldChrom(row+1:-1:row,:));
    end
end
end
% End of function



% low level function for calculating an offspring
% using ERX crossover
% given 2 parent in the Parents - argument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent
function Offspring=edge_recombination_crossover(Parents)
n = size(Parents,2);
Offspring = zeros(1,n);

edgemap = edge_map(Parents); %create edgemap
unvisited = true(n,1); %contains the unvisited cities

%choose random city to start
curr = randi(n);
unvisited(curr) = false;
Offspring(1) = curr;

for k=2:n    
    %remove all occurences of current city from connected cities
    edgemap(:,curr) = 0;
    
    %check if current city has entries
    if any(edgemap(curr, :))
       %determine which of the cities 
       %in the edgelist of current city has 
       %fewest entitities in own edge list
       others = find(edgemap(curr, :), 4, 'first');
       edge_lengths = sum( edgemap(others, :) ~= 0,  2);
       [~, idx] = min(edge_lengths);
       curr = others(idx);
          
    else
        %select random unvisited city
        unvisitedIdx = find(unvisited, n-k+1, 'first'); 
        curr = unvisitedIdx(randi(length(unvisitedIdx)));
    end
    
    %add to offspring and set visited
    Offspring(k) = curr;
    unvisited(curr) = false;
end
end

%high-level cyclic crossover
function NewChrom = CX_crossover(OldChrom, XOVR)
if nargin < 2, XOVR = NaN; end
nbRows=size(OldChrom,1);

NewChrom = OldChrom;
if rem(nbRows,2)~=0
   nbRows=nbRows-1;
end

for row=1:2:nbRows
    % crossover of the two chromosomes
    % results in 2 offsprings obtained by crossover CX operator
    if rand<XOVR  % recombine with a given probability
        NewChrom(row,:) = cyclic_crossover(OldChrom(row:row+1,:));
        NewChrom(row+1,:)= cyclic_crossover(OldChrom(row+1:-1:row,:));
    end
end

end
% End of function


% low level function for calculating an offspring
% using cyclic crossover
% given 2 parent in the Parents - argument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent
function Offspring=cyclic_crossover(Parents)
Offspring = zeros(1,size(Parents,2));

i = 1; %index into first parent
%loop while offspring does not contain selected node
while (all(Offspring ~= Parents(1,i))) 
    Offspring(i) = Parents(1,i);
    i = find(Parents(1,:) == Parents(2,i), 1, 'first');
end
 
% fill up the rest of the child with information from parent 2
stillToFill = (Offspring == 0);
Offspring(stillToFill) = Parents(2,stillToFill); 
end

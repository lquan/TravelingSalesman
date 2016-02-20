% PMX crossover operator for TSP
function NewChrom = PMX_crossover(OldChrom, XOVR)

if nargin < 2, XOVR = NaN; end
   
nbRows=size(OldChrom,1);

NewChrom = OldChrom;
if rem(nbRows,2)~=0
   nbRows=nbRows-1;
end

for row=1:2:nbRows
    % crossover of the two chromosomes
    % results in 2 offsprings obtained by crossover O1 operator
    if rand<XOVR  % recombine with a given probability               
        NewChrom(row,:) = partially_matched_crossover([OldChrom(row,:); OldChrom(row+1,:)]);   
        NewChrom(row+1,:)= partially_matched_crossover([OldChrom(row+1,:); OldChrom(row,:)]);
    end
end

end
% End of function



% low level function for calculating an offspring
% using PMX crossover
% given 2 parent in the Parents - argument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent
function Offspring=partially_matched_crossover(Parents)
cols = size(Parents,2);

%select two different positions in the tour for the splitpoints
rndi = zeros(cols, [1,2])
while (rndi(2) == rndi(1)), rndi(2) = randi(cols); end
rndi = sort(rndi);

subtour1 = Parents(1, rndi(1):rndi(2)); %the subtour between splitpoints from parents 1
subtour2 = Parents(2, rndi(1):rndi(2)); %the corresponding mapping values 

%put the subtour in the offspring
Offspring = Parents(2,:);
Offspring(rndi(1):rndi(2)) = subtour1;

%part before subtour
for k=1:rndi(1)-1
    while (sum(Offspring == Offspring(k)) > 1)
        idx = find(subtour1 == Offspring(k), 1, 'first');
        Offspring(k) = subtour2(idx);
    end
end
%part after subtour
for k=rndi(2)+1:cols
    while (sum(Offspring == Offspring(k)) > 1)
        idx = find(subtour1 == Offspring(k), 1, 'first');
        Offspring(k) = subtour2(idx);
    end
end
end

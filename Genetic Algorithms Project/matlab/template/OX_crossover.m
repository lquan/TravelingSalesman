% OX1 crossover operator for TSP
function NewChrom = OX_crossover(OldChrom, XOVR)
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
        NewChrom(row,:) = order_crossover(OldChrom(row:row+1,:)); 
        NewChrom(row+1,:)= order_crossover(OldChrom(row+1:-1:row,:));
    end
end

end
% End of function


% low level function for calculating an offspring
% using order crossover OX1
% given 2 parent in the Parents - argument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent
function Offspring=order_crossover(Parents)
cols = size(Parents,2);

% select two different positions in the tour for the splitpoints
rndi = randi(cols,[1,2]);
while (rndi(2) == rndi(1)), rndi(2) = randi(cols); end
rndi = sort(rndi);

%the subtour between splitpoints from parents 1
subtour = Parents(1, rndi(1):rndi(2)); 
%filter out elements already in subtour from parent2
par2_filtered = Parents(2, ~ismember(Parents(2,:), subtour));

%create the resulting offspring
Offspring = [par2_filtered(1:rndi(1)-1) subtour par2_filtered(rndi(1):end)];
end

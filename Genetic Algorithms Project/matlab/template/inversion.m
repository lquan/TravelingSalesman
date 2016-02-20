% low level function for TSP mutation
% inversion mutation
function NewChrom = inversion(OldChrom)
n = length(OldChrom);

% select two positions in the tour
rndi = randi(n,[1,2]);
while (rndi(2) == rndi(1)), rndi(2) = randi(n); end
rndi = sort(rndi);

%get and remove the subtour
subtour = OldChrom(rndi(2):-1:rndi(1));
NewChrom = [OldChrom(1:rndi(1)-1) OldChrom(rndi(2)+1:end)];

% select the index to insert the subtour
subtourI = randi(length(NewChrom)+1); %+1 because it is an insertion

NewChrom = [ NewChrom(1:subtourI-1) subtour NewChrom(subtourI:end) ];

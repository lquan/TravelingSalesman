% low level function for TSP mutation
% simple inversion mutation operator
function NewChrom = simple_inversion(OldChrom)
n = size(OldChrom,2);
NewChrom = OldChrom;

% select two positions in the tour
rndi = randi(n,[1,2]);
while (rndi(2) == rndi(1)), rndi(2) = randi(n); end
rndi = sort(rndi);

NewChrom(rndi(1):rndi(2)) = NewChrom(rndi(2):-1:rndi(1));

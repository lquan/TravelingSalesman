% low level function for TSP mutation
% exchange mutation : two random cities in a tour are swapped
% also known as: swap mutation, point mutation, reciprocal exchange or
% order-based mutation
function NewChrom = exchange(OldChrom)
NewChrom = OldChrom;
n = size(NewChrom,2);

%create indices of swapped cities
rndi = randi(n,[1,2]);
while (rndi(2) == rndi(1)), rndi(2) = randi(n); end

%swap the cities in the tour
buffer = NewChrom(rndi(1));
NewChrom(rndi(1)) = NewChrom(rndi(2));
NewChrom(rndi(2)) = buffer;

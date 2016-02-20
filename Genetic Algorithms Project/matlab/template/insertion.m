% low level function for TSP mutation
% insertion mutation
function NewChrom = insertion(OldChrom)
n = length(OldChrom);
NewChrom = OldChrom;

% select a random city in the given tour and remove it in result
rndInd = randi(n);
selected = NewChrom(rndInd);
NewChrom(rndInd) = [];

% select a random position in the tour and perform the insertion
rndInd = randi(n);
NewChrom = [NewChrom(1:rndInd-1) selected NewChrom(rndInd:end)];

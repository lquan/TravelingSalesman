%
% ObjVal = tspfun(Phen, Dist)
% Implementation of the TSP fitness function
%	Phen contains the phenocode of the matrix coded in
%	representation -> adapted to path representation

%	Dist is the matrix with precalculated distances between each pair of cities
%	ObjVal is a vector with the fitness values for each candidate tour (=each row of Phen)
%

function ObjVal = tspfun2(Phen, Dist)
	[nbIndividuals, nbCities] = size(Phen);
	
    %%% vectorized function works ~10 times faster
    Phen2 = [Phen(:,2:end) Phen(:,1)]'; %shifted version
    Phen = Phen';                       %for sub2ind input
    
    ObjVal = sum(reshape(Dist(sub2ind(size(Dist), Phen(:), Phen2(:))), ...
                   nbCities, nbIndividuals))';  %transpose to get a row vector
              
end
% End of function

%
% ObjVal = tspfun(Phen, Dist)
% Implementation of the TSP fitness function
%	Phen contains the phenocode of the matrix coded in
%	representation -> adapted to path representation

%	Dist is the matrix with precalculated distances between each pair of cities
%	ObjVal is a vector with the fitness values for each candidate tour (=each row of Phen)
%

function ObjVal = tspfun(Phen, Dist)
	nbIndividuals = size(Phen,1);
	
    %%% using a for loop, semi-vectorized
    ObjVal = zeros(nbIndividuals,1);
	for k=1:nbIndividuals
	   ObjVal(k) = sum(Dist(sub2ind(size(Dist), Phen(k,:), [Phen(k,2:end) Phen(k,1)])));
	end
 
end
% End of function

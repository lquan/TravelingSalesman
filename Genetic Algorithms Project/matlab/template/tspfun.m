%
% ObjVal = tspfun(Phen, Dist)
% Implementation of the TSP fitness function
%	Phen contains the phenocode of the matrix coded in
%	representation -> adapted to path representation

%	Dist is the matrix with precalculated distances between each pair of cities
%	ObjVal is a vector with the fitness values for each candidate tour (=each row of Phen)
%

function ObjVal = tspfun(Phen, Dist)
	[nbIndividuals, nbCities] = size(Phen);
	
	%% vectorized function works ~10 times faster 
    Phen = Phen';                          %column order
    Phen2 = [ Phen(2:end,:) ; Phen(1,:) ]; %shifted version
    ObjVal = sum(reshape(Dist(sub2ind(size(Dist), Phen(:), Phen2(:))), ...
                     nbCities, nbIndividuals))';  %transpose to get a row vector
	
    %% using a for loop, semi-vectorized
    %ObjVal = zeros(nbIndividuals,1);
	%for k=1:nbIndividuals
	%  ObjVal(k) = sum(Dist(sub2ind(size(Dist), Phen(k,:), [Phen(k,2:end) Phen(k,1)])));
	%end        
end

% tsp_ImprovePopulation.m
% Author: Mike Matton
% 
% This function improves a tsp population by removing local loops from
% each individual.
%
% Syntax: improvedPopulation = tsp_ImprovePopulation(popsize, ncities, pop, improve, dists)
%
% Input parameters:
%   popsize           - The population size
%   ncities           - the number of cities
%   pop               - the current population (adjacency representation)
%   improve           - Improve the population (0 = no improvement, <>0 = improvement)
%   dists             - distance matrix with distances between the cities
%
% Output parameter:
%   improvedPopulation  - the new population after loop removal (if improve
%                          <> 0, else the unchanged population).

function newpop = tsp_ImprovePopulation(popsize, ncities, pop, improve,dists)

if (improve)
   %loss_fun = @(x) tspfun(x,dists); %loss function is simply distance
   %neighbor_fun = @simple_inversion; %neighborhood function generator
   
   for i=1:popsize
     pop(i,:) = improve_path(ncities, pop(i,:),dists); %adj2path removed , was adj2path(pop(i,:))
   end
end

newpop = pop;

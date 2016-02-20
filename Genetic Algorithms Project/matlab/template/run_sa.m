function [BestTour, Dist, PlotValues, totalTime] = run_sa(x, y, INITIAL_NN)

NVAR = numel(x);
Dist = calc_dist_matrix(x,y);
tic;
if (INITIAL_NN)
   tic
   Path = nn_heuristic(Dist);
   toc
   DistInit = tspfun(Path, Dist)
else
   Path = randperm(NVAR);
end

loss_fun = @(x) tspfun(x,Dist); %loss function is simply distance
neighbor_fun = @(x) exchange(x);


[BestTour, Dist, PlotValues] = anneal(loss_fun, Path, ...
                              struct('Generator', neighbor_fun, ...
                              'CoolSched', @(T) (.9*T), ...
                              'MaxConsRej', 2500, ...
                              'MaxTries', 500, ...
                              'InitTemp', 1) ); 
totalTime = toc;

end

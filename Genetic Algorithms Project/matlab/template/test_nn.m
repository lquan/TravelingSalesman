dataset = load('benchmarks/rbx711.tsp', '-ascii');
% Dist = calc_dist_matrix( dataset(:,1), dataset(:,2) );
% 
% tic;
% path = nn_heuristic(Dist)
% obj = tspfun(path, Dist)
% toc

[BestTour, Dist, ~, totalTime]  = run_sa(dataset(:,1), dataset(:,2), true)


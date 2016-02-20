function run_ga(x, y, NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, ...
                PR_CROSS, PR_MUT, BIAS_NN, CROSSOVER, MUTATION,  ...
                SELECTION, LOCALLOOP, ...
                ah1, ah2, ah3, update)
% usage: run_ga(x, y,
%               NIND, MAXGEN, NVAR,
%               ELITIST, STOP_PERCENTAGE,
%               PR_CROSS, PR_MUT, CROSSOVER,
%               ah1, ah2, ah3)
%
%
% x, y: coordinates of the cities
% NIND: number of individuals
% MAXGEN: maximal number of generations
% ELITIST: percentage of elite population
% STOP_PERCENTAGE: percentage of equal fitness (stop criterium)
% PR_CROSS: probability for crossover
% PR_MUT: probability for mutation
% PR_BIAS: probability of bias on initial population to NN heuristic
% CROSSOVER: the crossover operator
% MUTATION: the mutation operator
% calculate distance matrix between each pair of cities
% ah1, ah2, ah3: axes handles to visualise tsp
tic;

{NIND MAXGEN NVAR ELITIST STOP_PERCENTAGE PR_CROSS PR_MUT BIAS_NN, ...
    CROSSOVER MUTATION SELECTION LOCALLOOP}

GGAP = 1 - ELITIST;
mean_fits = zeros(1,MAXGEN+1);
worst = zeros(1,MAXGEN+1);

Dist = calc_dist_matrix(x,y);

% initialize population
if (BIAS_NN && NIND > NVAR)
   NIND = NVAR;
end

Chrom = zeros(NIND, NVAR);
if (BIAS_NN)
   for k=1:NIND
       Chrom(k,:) = nn_heuristic(Dist,k); %row is starting city
   end  
else
    for k=1:NIND
        Chrom(k,:) = randperm(NVAR);
    end 
end

% number of individuals of equal fitness needed to stop
stopN = ceil(STOP_PERCENTAGE*NIND);
% evaluate initial population
ObjV = tspfun(Chrom,Dist);
best = zeros(1,MAXGEN);

% generational loop
for gen=1:MAXGEN
    %sort the objective values
    [sObjV, sInd] = sort(ObjV);
    
    best(gen) = sObjV(1);        %min(ObjV), changed O(N) to O(1)
    mean_fits(gen) = mean(ObjV);
    worst(gen) = sObjV(end);     %max(ObjV), changed O(N) to O(1)
    
    visualizeTSP(x,y,Chrom(sInd(1),:), best(gen), ah1, gen-1, best, mean_fits, worst, ah2, ObjV, NIND, ah3, update);

    if (sObjV(stopN)-sObjV(1) <= 1e-15)
        fprintf('converged at %d-th iteration\n', gen);
        break;
    end
    
    %assign fitness values to entire population
    FitnV = ranking(ObjV);
    %select individuals for breeding
    SelCh = select(SELECTION, Chrom, FitnV, GGAP);
    %recombine individuals (crossover)
    SelCh = recombin(CROSSOVER,SelCh,PR_CROSS);
    SelCh = mutateTSP(MUTATION,SelCh,PR_MUT);
    %evaluate offspring, call objective function
    ObjVSel = tspfun(SelCh,Dist);
    %reinsert offspring into population
    [Chrom ObjV] = reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    %apply local heuristics
    Chrom = tsp_ImprovePopulation(NIND, NVAR, Chrom, LOCALLOOP, Dist);
end

title(ah2, sprintf('Time: %.1f s', toc));
end
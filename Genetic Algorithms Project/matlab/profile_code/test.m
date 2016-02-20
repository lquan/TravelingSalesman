files = dir('*.tsp');
POPSIZE = 50;
for k=1:numel(files)
    name2 = files(k).name;
    xy = load(name2);
    NB = size(xy,1);
    fprintf('%s: %d\n', name2, NB);
    tic
    Dist = calc_dist_matrix(xy(:,1), xy(:,2));
    toc
    
    tic
    Dist2 = calc_dist_matrix2(xy);
    toc
    
    
    
    tic 
    Dist3 = calc_dist_matrix3(xy(:,1),xy(:,2));
    toc
    if ( sum(sum(Dist- Dist2)) ~=0 || sum(sum(Dist-Dist3) ~= 0))
       fprintf('uhoh'); 
    end
    
    fprintf('\n');
    Population = zeros(POPSIZE, NB);
    
    for z=1:POPSIZE
        Population(z,:) = randperm(NB);
    end
    tic
    ObjVal = tspfun(Population, Dist);
    toc
    
    tic
    ObjVal2 = tspfun2(Population, Dist);
    toc
    if ( sum(ObjVal - ObjVal2) ~= 0 )
        fprintf('uhuoh');
    end
    
end
    

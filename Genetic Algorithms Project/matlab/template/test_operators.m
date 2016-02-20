clc;
N = 50;
NB_CITIES = 50;


operators = {'CX_crossover', 'ERX_crossover', 'PMX_crossover', 'OX_crossover'};
for m=1:numel(operators) %loop over operators
    par1 = randperm(NB_CITIES);
    par2 = randperm(NB_CITIES);
    for k=1:N %nb of times operator is performed
        offspring = feval(crossovers{m}, [par1; par2], 1);
        
        if ( numel(unique(offspring(1,:))) ~= NB_CITIES || ...
                numel(unique(offspring(2,:))) ~= NB_CITIES )
           fprintf('%s gave error for following paths\n', operators{m});
           disp(par1);
           disp(par2);
           disp(offspring);
           return;
                    
        else
            par1 = offspring(1,:);
            par2 = offspring(2,:);
        end
    end
    
end

fprintf('successful\n')
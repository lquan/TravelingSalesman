% low level function for TSP mutation
% chooses between one of four mutation operators:
%     CX_crossover
%     OX_crossover
%     (E)ERX_crossover
%     PMX_crossover

function Out = hybrid_crossover(In, XOVR)
choice = randi(4);

switch(choice)
    case 1
        Out = CX_crossover(In, XOVR);
    case 2
        Out = OX_crossover(In, XOVR);
    case 3
        Out = EERX_crossover(In, XOVR);
    case 4
        Out = PMX_crossover(In, XOVR);
    otherwise
        Out = In;
end

end
% End of function

% low level function for TSP mutation
% chooses between one of four mutation operators:
%     simple inversion mutation
%     inversion mutation
%     exchange mutation
%     insertion mutation

function NewChrom = hybrid_mutation(OldChrom)
choice = randi(4);

switch(choice)
    case 1
        NewChrom = simple_inversion(OldChrom);
    case 2
        NewChrom = inversion(OldChrom);
    case 3
        NewChrom = exchange(OldChrom);
    case 4
        NewChrom = insertion(OldChrom);
    otherwise
        NewChrom = OldChrom;
end

end
% End of function

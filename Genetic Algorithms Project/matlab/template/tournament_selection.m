% TOURNAMENT_SELECTION.M          
function NewChrIx = tournament_selection(FitnV,Nsel,K)
   Nind = size(FitnV,1);
   % K = tournament size, default is 10% of population size; 
   % can not be easily integrated with gatbx toolbox functions
   % that is why it is for now here hacked in
   if (nargin < 3), K = ceil(0.1*Nind); end
   
   NewChrIx = zeros(Nsel,1);
   for k=1:Nsel
     tournament_indices = randsample(Nind,K);
     [~,max_idx] = max(FitnV(tournament_indices));
     NewChrIx(k) = tournament_indices(max_idx);
   end
end

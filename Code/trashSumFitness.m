function [trashSumFitness] = trashSumFitness (droneCapac, trashSum)
   %difference between total amount of drone capacity vs. trashs
   %extinguished's trash retardant requirements
   trashSumFitness = (abs(droneCapac - trashSum))^1;
        

end


%     trashSumFitness = floor((droneCapac - trashSum)^1);
%     if (trashSumFitness < -0.5)
%         trashSumFitness = trashSumFitness * 2;
%     else
%     end

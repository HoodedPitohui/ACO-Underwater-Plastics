function [ trashFitness, trashTotDiffFit, trashEqFit, trashIntFit ] = trashFitnessFunction (ant, droneCapac, totalDrones, totaltrashs)
    if length(ant.tour) == 0
        trashFitness = 10000;
        trashTotDiffFit = 10000;
        trashEqFit = 10000;
        trashIntFit = 10000;
    else
        trashTotDiffFit = trashSumFitness(droneCapac, ant.trashSum);
        trashFitness = 0.01 + trashTotDiffFit;
        iDronePertrash = totaltrashs / totalDrones; %ideal drones per trash
        trashEqFit = trashEqFitness(iDronePertrash, length(ant.trashs));
        trashFitness = trashFitness + trashEqFit;
        trashIntFit = 0;
        for f = 1: length(ant.trashs)
            trashIntFit = trashIntFit + trashIntFitness(droneCapac, iDronePertrash, ant.trashs(f));
        end
        trashFitness = trashFitness + trashIntFit;
    end
end

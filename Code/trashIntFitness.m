function [trashIntFitness] = trashIntFitness(droneCapac, iDronePertrash, trashPoint)
    trashIntFitness = (abs(droneCapac / iDronePertrash - trashPoint))^(1/3);
end
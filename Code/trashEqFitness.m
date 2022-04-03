function [ trashEqFitness ] = trashEqFitness (iDronePertrash, length)
    %if trash number is equal across them.
   trashEqFitness = (abs(iDronePertrash - length))^(3/4); %1/2 3/4 %^
end
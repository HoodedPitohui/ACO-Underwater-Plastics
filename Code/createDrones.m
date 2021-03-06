function [drones] = createDrones(trashs, droneNo) %create the drones
    %all of the drones start in the same place, and have the same
    %intensities, with their x and y starting points and trash values depending on
    %averages of the trash locations, and the z value being set to 0
    
    drones.capac = zeros(1, droneNo);
    for i = 1: droneNo
        drones.capac(1, i) = mean(trashs.intensity) * (length(trashs.locX) / droneNo);
    end
    drones.locX = zeros(1, droneNo);
    for i = 1: droneNo
        drones.locX(i) = min(trashs.locX) + (max(trashs.locX) - min(trashs.locX)) / droneNo * 3;
    end
    
    drones.locY = zeros(1, droneNo);
    for i = 1: droneNo
        drones.locY(i) = min(trashs.locY) - 0.25;
    end
    drones.locZ = zeros(1, droneNo);

    % control trial
%     drones.capac = [3 6 9 12 15];
%     drones.locX = [10 10 10 10 10];
%     drones.locY = [0 0 0 0 0];
%     drones.locZ = [0 0 0 0 0];
end

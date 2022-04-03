function [ colony ] = createColonies( iterationNum, graph, trashIntensity, droneCapac, droneNo, colony , antNo, tau, eta, alpha,  beta, toursFound)
    %find vehicle routes
    nodeNo = graph.n;
    %if this is not the first iteration, clear all of the stored ant routes
    %of the previous path
    if iterationNum > 1
        for i = 1: antNo
            while isempty(colony(droneNo).ant(i).tour) == 0
                colony(droneNo).ant(i).tour(1) = [];
                colony(droneNo).ant(i).trashs(1) = [];
            end
        end
    else
    end
    for i = 1 : antNo
    
        initial_node = randi( [1 , nodeNo] ); % select a random node 
        
        %if the node selected was used by a previous drone, find a
        %different node
        while ismembertol(initial_node, toursFound) == 1
            initial_node = randi( [1 , nodeNo] ); % select a random node 
        end
        colony(droneNo).ant(i).trashSum = trashIntensity(initial_node);
        colony(droneNo).ant(i).trashs(1) = trashIntensity(initial_node);
        colony(droneNo).ant(i).tour(1) = initial_node;
        j = 2;
        %add nodes until the drone capacity is less than the amount of trash
        %extinguisher added in all of the drone's paths
        while droneCapac > colony(droneNo).ant(i).trashSum && j < nodeNo
            currentNode =  colony(droneNo).ant(i).tour(end);
            P_allNodes = tau( currentNode , :  ) .^ alpha .* eta( currentNode , :  )  .^ beta; %search here for fix
            P_allNodes(colony(droneNo).ant(i).tour) = 0;
            P_allNodes(toursFound) = 0;
            P = P_allNodes ./ sum(P_allNodes);
            if isnan(P)
                break
            else
            end
            nextNode = rouletteWheel(P); 
            
            %add the trashs and their intensity to the appropriate
            %parameters
            colony(droneNo).ant(i).tour = [  colony(droneNo).ant(i).tour , nextNode ];
            colony(droneNo).ant(i).trashs = [ colony(droneNo).ant(i).trashs, trashIntensity(nextNode)];
            colony(droneNo).ant(i).trashSum = [colony(droneNo).ant(i).trashSum + trashIntensity(nextNode)];
            j = j + 1;
                
        end
        
        %if the last node added exceeds the capacity of the drone, remove
        %the last node
        if droneCapac < colony(droneNo).ant(i).trashSum 
            colony(droneNo).ant(i).trashSum = [colony(droneNo).ant(i).trashSum - trashIntensity(colony(droneNo).ant(i).tour(j-1))];
            colony(droneNo).ant(i).trashs(j - 1) = [];
            colony(droneNo).ant(i).tour(j - 1) = [];
        else
        end
    end
end

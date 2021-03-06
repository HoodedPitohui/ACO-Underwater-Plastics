function [trashs] = createtrashs(fileName, sheetName) %get trash values
    t = table2cell(readtable(fileName, 'sheet', sheetName));
    %convert from cell to array and transpose it (')
    trashs.intensity = cell2mat(t(:, 7))'; 
    %all the values are by default raised to 10^5 (due to actual distances), 
    %so we want to reduce that to save computational power. Distance does 
    %not play a role in the fitness algorithm's decision making, so for 
    %simplicity in the graph we can make this decision.
    trashs.locX = cell2mat(t(:, 9))'; 
    trashs.locY = cell2mat(t(:, 10))';
    trashs.locZ = cell2mat(t(:, 11))';
    
    %control trial values
%     trashs.intensity = [1 1 1 2 2 2 3 3 3 4 4 4 5 5 5];
%     trashs.locX = [0 0 0 5 5 5 10 10 10 15 15 15 20 20 20];
%     trashs.locY = [5 10 15 5 10 15 5 10 15 5 10 15 5 10 15];
%     trashs.locZ = [15 10 5 15 10 5 15 10 5 15 10 5 15 10 5];
end

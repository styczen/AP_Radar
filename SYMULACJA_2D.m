%%%%%%%%%%%%%%%%%%%% Simulation %%%%%%%%%%%%%%%%%%%%%%%%
close all, clear all;

load dane.mat % loading data from .mat file
x_axis = [-10, 10]; y_axis = [0, 10]; z_axis = [0, 10]; % axis limits

for i=1:time % time loop
    clf
    axis([x_axis, y_axis, z_axis])
    hold on
    for j=1:size(object,2) % Loop to display every object
        if (object(j).visibility(i) == 1) 
            plotObj(object(j), i)
        end
    end    
    if i==2
        pause(2)
    end
    
    %line([-1.3 -1.3],y_axis), line([1.3 1.3],y_axis) % road boundaries
    % because radar cannot see the road only higher objects

    pause(0.01)
end
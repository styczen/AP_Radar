%%%%%%%%%%%%%%%%%%%% Simulation %%%%%%%%%%%%%%%%%%%%%%%%
close all, clear all;

load dane.mat % loading data from .mat file
x_axis = [-10, 10]; y_axis = [0, 10]; % axis limits

for i=1:time % time loop
    clf     
%     plot(object(1).x(:,:,i), object(1).y(:,:,i),'k')
%     axis([x_axis, object(1).y(i,1) object(1).y(i,1)+vis])
    axis([x_axis, y_axis])
    hold on
    for j=1:size(object,2) % Loop to display every object
        if (object(j).visibility(i) == 1) 
            switch object(j).type
            case 1 
            plot(object(j).x(:,:,i), object(j).y(:,:,i), 'k')
            case 2
            plot(object(j).x(:,:,i), object(j).y(:,:,i), 'k')
            case 3
            plot(object(j).x(:,:,i), object(j).y(:,:,i), 'k')  
            case 4 
            plot(object(j).x(:,:,i), object(j).y(:,:,i), 'k')
            end
        end
    end    
    line([-1.3 -1.3],y_axis), line([1.3 1.3],y_axis) % road boundaries
    % because radar cannot see the road only higher objects

    pause(0.01)
end
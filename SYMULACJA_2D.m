%%%%%%%%%%%%%%%%%%%% Simulation %%%%%%%%%%%%%%%%%%%%%%%%
close all, clear all;

load dane.mat % loading data from .mat file
z_axis = [0, 20]; % axis limits

for i=1:time-50 % time loop
    clf
    
    x_axis=[y(i)-10 y(i)+10];
    y_axis=[i i+25];
    axis([x_axis, y_axis, z_axis])
    
    hold on
    plot(y+2.5,x);  %road plot
    plot(y-2.5,x);  %road plot
    
    kat=atan(4/(y(i+10)-y(i)));
    view([-kat,0])
    
    for j=1:size(object,2) % Loop to display every object
        if (object(j).visibility(i) == 1) 
            plotObj(object(j), i)
        end
    end    
    if i==2
        pause(5)
    end
    
    %line([-1.3 -1.3],y_axis), line([1.3 1.3],y_axis) % road boundaries
    % because radar cannot see the road only higher objects

    pause(0.04)
end
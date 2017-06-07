%%%%%%%%%%%%%%%%%%%% Simulation %%%%%%%%%%%%%%%%%%%%%%%%
close all, clear all;

load dane.mat % loading data from .mat file
z_axis = [0, 20]; % axis limits

for i=1:time-50 % time loop
    clf
    
    x_axis=[x(i)-10 x(i)+10];
    y_axis=[i i+100];
    axis([x_axis, y_axis, z_axis])
    
    hold on
    plot(x+2.5,y);  %road plot
    plot(x-2.5,y);  %road plot
    
%     kat=atan((y(i+1)-y(i))/(x(i+1)-x(i)))*180/pi
%     view([kat,90])
%     view([0,5])
%     campos([x(i+1)-x(i), y(i+1)-y(i), 0])
    view([x(i+1)-x(i), y(i+1)-y(i), 0])
    xlabel('x'), ylabel('y'), zlabel('z')
    for j=1:size(object,2) % Loop to display every object
        if (object(j).visibility(i) == 1) 
            plotObj(object(j), i)
        end
    end    
    if i==2
%         pause(15)
    end
    
    %line([-1.3 -1.3],y_axis), line([1.3 1.3],y_axis) % road boundaries
    % because radar cannot see the road only higher objects

%     pause(0.04)
  pause(0.05)
end
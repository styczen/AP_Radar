% Simulate 
close all
clear all

load dane.mat % loading data from .mat file
z_axis = [-20, 30]; % axis limits

for i=1:time-200 % time loop 
    % subtraction of 200 because animation lasts until there are buildings
    clf
    
    hold on
    plot(x+2.5,y,'-r','LineWidth',1);   %road plot
    plot(x,y,'--k');                    %road plot
    plot(x-2.5,y,'-r','LineWidth',1);   %road plot
    
    % calculation of angle
    angle = atan((y(i+20)-y(i))/abs((x(i+20)-x(i))))*180/pi;
    if x(i+20) > x(i)
        angle = 90-angle;
    else
        angle = angle-90;
    end
    
    % calculation of axis limits
    dx=angle*0.5;
    x_axis=[x(i)-25+dx x(i)+25+dx];
    y_axis=[i i+50];
    axis([x_axis, y_axis, z_axis])
    
    view([-angle, 1])  % view angle setup
    camzoom(5.5)     % zoom of current axes

    for j=1:size(object,2) % Loop to display every object
        if (object(j).visibility(i) == 1) 
            plotObj(object(j), i)
        end
    end
    
    % Initial pause
    if i == 2
        pause(7)    % time in seconds
    end
    
  pause(0.05)   % pause in simualation in seconds
end
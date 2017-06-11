%%%%%%%%%%%%%%%%%%%% Simulation %%%%%%%%%%%%%%%%%%%%%%%%
close all, clear all;

load dane.mat % loading data from .mat file
z_axis = [0, 50]; % axis limits

for i=1:time-211 % time loop
    clf
    
    x_axis=[x(i)-25 x(i)+25];
    y_axis=[i i+50];
    axis([x_axis, y_axis, z_axis])
    
    hold on
    plot(x+2.5,y);  %road plot
    plot(x-2.5,y);  %road plot
    
    %liczenie k¹ta nachylenia drogi i ustawienie widoku
    kat=atan((y(i+20)-y(i))/abs((x(i+20)-x(i))))*180/pi;
    if x(i+20)>x(i)
        kat=90-kat
    else
        kat=kat-90
    end
    view([-kat,1])

%     xlabel('x'), ylabel('y'), zlabel('z')
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

%     pause(0.04)
  pause(0.05)
end
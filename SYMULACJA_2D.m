%%%%%%%%%%%%%%%%%%%% Simulation %%%%%%%%%%%%%%%%%%%%%%%%
close all, clear all;

load dane.mat % loading data from .mat file
z_axis = [-20, 30]; % axis limits

for i=1:time-211 % time loop
    clf
    
    hold on
    plot(x+2.5,y);  %road plot
    plot(x-2.5,y);  %road plot
    
    %liczenie k¹ta nachylenia drogi
    kat=atan((y(i+20)-y(i))/abs((x(i+20)-x(i))))*180/pi;
    if x(i+20)>x(i)
        kat=90-kat;
    else
        kat=kat-90;
    end
    
    %obliczenie zakresu osi
    dx=kat*0.5;
    x_axis=[x(i)-25+dx x(i)+25+dx];
    y_axis=[i i+50];
    axis([x_axis, y_axis, z_axis])
    
    view([-kat,1])  %ustawienie k¹ta patrzenia
    camzoom(4)      %zoom srodka plota

    for j=1:size(object,2) % Loop to display every object
        if (object(j).visibility(i) == 1) 
            plotObj(object(j), i)
        end
    end
    
    %Pausa na start
    if i==2
        pause(5)    %w sekundach
    end
    

  pause(0.05)   %szybkoœæ animacji
end
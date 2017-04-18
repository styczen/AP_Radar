close all
clear all

%%%%%%%%%%%%%%%%%%% Generowanie danych wejœciowych %%%%%%%%%%%%%%%%
time=500;
x_axis = [-10, 10]; y_axis = [-10, 10]; % axis limits
vis=10; %zasieg widzenia obiektow
tr1 = 0.05; %odleg³oœæ zmian po³o¿enia w ka¿dym kroku

%pozycje startowe
x0=[0 -1 -1 0];
y0(1,:) = [10 10 9 9];
x1=[0 1 1 0];
y1(1,:) = [-10 -10 -9 -9];
x2=[0 1 1 0];
y2(1,:) = [-5 -5 -4 -4];

v0=zeros(time,1);
v2=zeros(time,1);
for i=2:time
    y0(i,:)=y0(i-1,:)-tr1*4; 
    y1(i,:)=y1(i-1,:)+tr1;
    y2(i,:)=y2(i-1,:)+tr1*2;
    %okreslanie odleglosci od obiektu glownego (car1)
    if(abs(y1(i,1)-y0(i,1))<vis)
        v0(i)=1;
    end
    if(abs(y1(i,1)-y2(i,1))<vis)
        v2(i)=1;
    end
end

%Dane wejœciowe które program otrzymuje, po wygenerowaniu mozna zapisaæ do
%pliku .mat i wczytac w symulatorze
car0 = struct('x',x0 ,'y',y0 ,'speed', -tr1*4 ,'visibility',v0)
car1 = struct('x',x1 ,'y',y1 ,'speed', tr1 ,'visibility',ones(time,1))
car2 = struct('x',x2 ,'y',y2 ,'speed', tr1*2 ,'visibility',v2)

save('dane.mat','car0','car1','car2','time')



%%%%%%%%%%%%%%%%%%%% Program do symualcji %%%%%%%%%%%%%%%%%%%%%%%%
close all, clear all;
load dane.mat
x_axis = [-10, 10]; y_axis = [-10, 10]; % axis limits
vis=15; %zasieg widocznosci symulacji
for i=1:time
    clf     
    plot(car1.x,car1.y(i,:),'k'), axis([x_axis,car1.y(i,1)-vis car1.y(i,1)+vis]), hold on
    if (car0.visibility(i) ==1) 
        plot(car0.x,car0.y(i,:),'k')
    end
    if (car2.visibility(i) ==1)
        plot(car2.x,car2.y(i,:),'k')
    end
    line([-1.3 -1.3],[-100 100]), line([1.3 1.3],[-100 100])

    pause(0.01)
end
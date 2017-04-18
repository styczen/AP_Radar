close all
clear all

%%%%%%%%%%%%%%%%%%% Generowanie danych wejœciowych %%%%%%%%%%%%%%%%
time=500;
x_axis = [-10, 10]; y_axis = [-10, 10]; % axis limits
vis=10; %zasieg widzenia obiektow
tr1 = 0.05; %odleg³oœæ zmian po³o¿enia w ka¿dym kroku

%pozycje startowe
x0=[0 1 1 0];
y0(1,:) = [-10 -10 -9 -9];
x1=[0 -1 -1 0];
y1(1,:) = [10 10 9 9];
x2=[0 1 1 0];
y2(1,:) = [-5 -5 -4 -4];

x3(1)=-2;
y3(1)=0;

v0=ones(time,1);
v1=zeros(time,1);
v2=zeros(time,1);
v3=zeros(time,1)

for i=2:time
    y0(i,:)=y0(i-1,:)+tr1; 
    y1(i,:)=y1(i-1,:)-tr1*4;
    y2(i,:)=y2(i-1,:)+tr1*2;
    y3(i)=y3(i-1)+tr1*0.25;
    x3(i)=x3(i-1)+(rand-0.4)/15;
    %okreslanie odleglosci od obiektu glownego (object(1))
    if(abs(y0(i,1)-y1(i,1))<vis)
        v1(i)=1;
    end
    if(abs(y0(i,1)-y2(i,1))<vis)
        v2(i)=1;
    end
    if(abs(y0(i,1)-y3)<vis)
        v3(i)=1;
    end
end

%Dane wejœciowe które program otrzymuje, po wygenerowaniu mozna zapisaæ do
%pliku .mat i wczytac w symulatorze
%Typy: 1-auto, 2-pieszy, 3-znak, 4-budynek
object = struct('type', {1,1,1,2}, 'x',{x0,x1,x2,x3} ,'y',{y0,y1,y2,y3} ,'height', {1.5,1.5,1.5,2},...
 'speed', {tr1,-tr1*4,tr1*2,tr1*0.25} ,'visibility',{v0,v1,v2,v3})


save('dane.mat','object','time')



%%%%%%%%%%%%%%%%%%%% Program do symualcji %%%%%%%%%%%%%%%%%%%%%%%%
close all, clear all;
load dane.mat
x_axis = [-10, 10]; y_axis = [-10, 10]; % axis limits
vis=15; %zasieg widocznosci symulacji
for i=1:time
    clf     
    plot(object(1).x,object(1).y(i,:),'k'), axis([x_axis,object(1).y(i,1) object(1).y(i,1)+vis]), hold on
    for j=1:size(object,2)    %Pêtla do wyœwietlania samochodów
        if (object(j).visibility(i) ==1) 
            switch object(j).type
            case 1
            plot(object(j).x,object(j).y(i,:),'k')
            case 2
            plot(object(j).x(i),object(j).y(i),'-o')
            case 3
            
            case 4
            
            end
        end
    end    
    line([-1.3 -1.3],[-100 100]), line([1.3 1.3],[-100 100])

    pause(0.01)
end
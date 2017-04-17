close all;
clear all;

t = linspace(0,1000,10000);
% Droga
h = animatedline;
j = animatedline;
x1 = zeros(1,10000)-ones(1,10000)*6;
y1 = ones(1,10000) .* t+10;
x2 = zeros(1,10000)+ones(1,10000)*6;
y2 = ones(1,10000) .* t+10;
% Poczatek drogi
x3 = [-6 -6];
y3 = [-10 10 ];
x4 = [6 6 ];
y4 = [-10 10 ];
hh = animatedline(x3,y3);
jj = animatedline(x4,y4);
% Samochód
x = [1 5 5 1 1];
y = [0 0 10 10 0];
l = animatedline(x,y,'Color','r','LineWidth',3);
% %Linia przerywana
% xl = [-1/4 1/4 1/4 -1/4 -1/4];
% yl = [0 0 5 5 0];
% ll = animatedline(xl,yl,'Color','r','LineWidth',3);
% Samochod inny
xx = [1-6 5-6 5-6 1-6 1-6];
yy = [0 0 10 10 0];
tt = animatedline(xx,yy,'Color','r','LineWidth',3);

for k = 1:length(t)
    clearpoints(l); 
    addpoints(h,x1(k),y1(k));
    addpoints(j,x2(k),y2(k));
    addpoints(l,x,y-9+k/10);

    if mod(k,800)==400
    clearpoints(h);
    clearpoints(j);
    hh = animatedline(x3,y3+k/10);
    jj = animatedline(x4,y4+k/10);
    clearpoints(tt);
    
    tt = animatedline(xx,yy+10+k/10,'Color','r','LineWidth',3);
    
    end
    if mod(k,800)==200
        clearpoints(hh);
        clearpoints(jj);
        if mod(k,1600)==400
            clearpoints(tt);
        end
    end
        axis([-10,10,-10+t(k),15+t(k)])
%     axis([-10,10,-10,500])
    drawnow;

end


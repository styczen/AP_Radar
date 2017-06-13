function plotObj(object,time)
% plotObj funtions takes object and time value
% and using patch() functions displays one objects in figure

% take object coordinates and save them in separate variables
x1=object.x(1,1,time);
x2=object.x(1,2,time);
x3=object.x(1,3,time);
x4=object.x(1,4,time);
y1=object.y(1,1,time);
y2=object.y(1,2,time);
y3=object.y(1,3,time);
y4=object.y(1,4,time);
z1=object.z(time);
z2=object.z(time);
z3=object.z(time);
z4=object.z(time);

% vertices and faces appropriate to send to patch
vert = [x1 y1 0; x2 y2 0; x3 y3 0; x4 y4 0; x1 y1 z1; x2 y2 z2; ...
        x3 y3 z3; x4 y4 z4];
fac = [1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8];

% switch between object type and display it with different color
% Types: 1-car, 2-pedestrian, 3-sign, 4-building and others
switch object.type
    case 1
        patch('Vertices',vert,'Faces',fac,...
        'FaceColor','blue')
    case 2
        patch('Vertices',vert,'Faces',fac,...
        'FaceColor','red')        
    case 3
        patch('Vertices',vert,'Faces',fac,...
        'FaceColor','black')        
    case 4
        patch('Vertices',vert,'Faces',fac,...
        'FaceColor','yellow')        
    case 5
        patch('Vertices',vert,'Faces',fac,...
        'FaceColor','green')        
end
  
% other view settings
set(gca, 'visible', 'off')
camproj('perspective')

end
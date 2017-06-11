close all
clear all

% Input data generation
time = 500; % simulation time
visibility = 5000; % for simulation to use less memory
tr1 = 1; % speed in regard to our vehicle

% road
% p1 = -8.1949e-09;
% p2 = 6.6409e-06;
% p3 = -0.0016397;
% p4 = 0.1922;
% p5 = 0;

p1 = -5.1073e-10;
p2 = 1.5322e-06;
p3 = -0.0014206;
p4 = 0.40715;
p5 = 0;

y=0:time-1;
x = p1*y.^4 + p2*y.^3 +p3*y.^2 + p4*y + p5; 

% generation of clean matrices
% obj0_x = zeros(2, 4, time);
% obj0_y = zeros(2, 4, time);
% 
% obj1_x = zeros(2, 4, time);
% obj1_y = zeros(2, 4, time);
% 
% obj2_x = zeros(2, 4, time);
% obj2_y = zeros(2, 4, time);
% 
% obj3_x = zeros(2, 4, time);
% obj3_y = zeros(2, 4, time);
% 
% obj4_x = zeros(2, 4, time); % pedestrian
% obj4_y = zeros(2, 4, time); 

obj0_x = zeros(1, 4, time);
obj0_y = zeros(1, 4, time);

obj1_x = zeros(1, 4, time);
obj1_y = zeros(1, 4, time);

obj2_x = zeros(1, 4, time);
obj2_y = zeros(1, 4, time);

obj3_x = zeros(1, 4, time);
obj3_y = zeros(1, 4, time);

obj4_x = zeros(1, 4, time); % pedestrian
obj4_y = zeros(1, 4, time); 

obj5_x = zeros(1, 4, time); % building
obj5_y = zeros(1, 4, time); 

obj6_x = zeros(1, 4, time); % car
obj6_y = zeros(1, 4, time); 

obj7_x = zeros(1, 4, time); % car
obj7_y = zeros(1, 4, time); 

% starting positions
% obj0_x(:,:,1) = [0, -1.7, -1.7, 0; ...
%                 -1.7, -1.7, 0, 0];
% obj0_y(:,:,1) = [4 4 0 0; ...
%                  4 0 0 4];
% obj0_z(:,:,1) = 1.4;
%              
% obj1_x(:,:,1) = obj0_x(:,:,1)+2;
% obj1_y(:,:,1) = obj0_y(:,:,1)+6;
% obj1_z(:,:,1) = 1.4;
% 
% obj2_x(:,:,1) = obj0_x(:,:,1)+2;
% obj2_y(:,:,1) = obj0_y(:,:,1)+15;
% obj2_z(:,:,1) = 1.4;
%              
% obj3_x(:,:,1) = [-7 -3 -3 -7; ...
%                  -3 -3 -7 -7];
% obj3_y(:,:,1) = [10 10 20 20; ...
%                  10 20 20 10];
% obj3_z(:,:,1) = 10; % builiding
% 
% obj4_x(:,:,1) = [-5 -4 -4 -5; ...
%                  -4 -4 -5 -5];
% obj4_y(:,:,1) = [3 3 4 4; ...
%                  3 4 4 3];
% obj4_z(:,:,1) = 0.80; % pedestrian

obj0_x(:,:,1) = [0, -1.7, -1.7, 0];
obj0_y(:,:,1) = [4 4 0 0];
obj0_z(:,:,1) = 1.4; % car
             
obj1_x(:,:,1) = obj0_x(:,:,1)+2;
obj1_y(:,:,1) = obj0_y(:,:,1)+6;
obj1_z(:,:,1) = 1.4; % car

obj2_x(:,:,1) = obj0_x(:,:,1)+2;
obj2_y(:,:,1) = obj0_y(:,:,1)+15;
obj2_z(:,:,1) = 1.4; % car
             
obj3_x(:,:,1) = [-7 -3 -3 -7];
obj3_y(:,:,1) = [10 10 20 20];
obj3_z(:,:,1) = 10; % builiding

obj4_x(:,:,1) = [-5 -4 -4 -5];
obj4_y(:,:,1) = [3 3 4 4];
obj4_z(:,:,1) = 0.80; % pedestrian

obj5_x(:,:,1) = [7 3 3 7];
obj5_y(:,:,1) = [10 10 20 20];
obj5_z(:,:,1) = 8; % builiding

obj6_x(:,:,1) = [26.78 28.12 28.8 27.3];
obj6_y(:,:,1) = [99 99 103 103];
obj6_z(:,:,1) = 1.5; % car

obj7_x(:,:,1) = [y(110)-2 y(110) y(114) y(114)-2];
obj7_y(:,:,1) = [110 110 114 114];
obj7_z(:,:,1) = 1.5; % car

% visibility vectors
vis_0=zeros(time, 1);
vis_1=zeros(time, 1);
vis_2=zeros(time, 1);
vis_3=zeros(time, 1); % building
vis_4=zeros(time, 1); % pedestrian
vis_5=zeros(time, 1); % building
vis_6=zeros(time, 1); % car
vis_7=zeros(time, 1); % car

for i=2:time-211 
    % y - axis calculation
    obj0_y(:,:,i) = obj0_y(:,:,i-1) - tr1*1; 
    obj1_y(:,:,i) = obj1_y(:,:,i-1) + tr1;
    obj2_y(:,:,i) = obj2_y(:,:,i-1) + tr1*1.2;
    obj3_y(:,:,i) = obj3_y(:,:,i-1) - tr1; % building
    obj4_y(:,:,i) = obj4_y(:,:,i-1) + tr1/2; % pedestrian
    obj5_y(:,:,i) = obj5_y(:,:,i-1) - tr1; % building
    obj6_y(:,:,i) = obj6_y(:,:,i-1) - tr1*1.1; % car
    obj7_y(:,:,i) = obj7_y(:,:,i-1) - tr1*1.1; % car
    
    % x - axis calculation    
    y00= p1*obj0_y(:,:,i).^4 + p2*obj0_y(:,:,i).^3 +p3*obj0_y(:,:,i).^2 + p4*obj0_y(:,:,i);
    y01= p1*obj1_y(:,:,i).^4 + p2*obj1_y(:,:,i).^3 +p3*obj1_y(:,:,i).^2 + p4*obj1_y(:,:,i);
    y02= p1*obj2_y(:,:,i).^4 + p2*obj2_y(:,:,i).^3 +p3*obj2_y(:,:,i).^2 + p4*obj2_y(:,:,i);
    y03= p1*obj3_y(:,:,i).^4 + p2*obj3_y(:,:,i).^3 +p3*obj3_y(:,:,i).^2 + p4*obj3_y(:,:,i);
    y04= p1*obj4_y(:,:,i).^4 + p2*obj4_y(:,:,i).^3 +p3*obj4_y(:,:,i).^2 + p4*obj4_y(:,:,i);
    y05= p1*obj5_y(:,:,i).^4 + p2*obj5_y(:,:,i).^3 +p3*obj5_y(:,:,i).^2 + p4*obj5_y(:,:,i);
    y06= p1*obj6_y(:,:,i).^4 + p2*obj6_y(:,:,i).^3 +p3*obj6_y(:,:,i).^2 + p4*obj6_y(:,:,i);
    y07= p1*obj7_y(:,:,i).^4 + p2*obj7_y(:,:,i).^3 +p3*obj7_y(:,:,i).^2 + p4*obj7_y(:,:,i);
    
    obj0_x(:,:,i) = obj0_x(:,:,1)+y00; % car
    obj1_x(:,:,i) = obj1_x(:,:,1)+y01; % car
    obj2_x(:,:,i) = obj2_x(:,:,1)+y02; % car
    obj3_x(:,:,i) = obj3_x(:,:,1)+y03; % building
    obj4_x(:,:,i) = obj4_x(:,:,1)+y04; % pedestrian
    obj5_x(:,:,i) = obj5_x(:,:,1)+y05; % building
    obj6_x(:,:,i) = y06-[2 0 0 2]; % car
    obj7_x(:,:,i) = y07-[2 0 0 2]; % car
    
    % z - axis calculation
    obj0_z(:,:,i) = obj0_z(:,:,i-1); 
    obj1_z(:,:,i) = obj1_z(:,:,i-1);
    obj2_z(:,:,i) = obj2_z(:,:,i-1);
    obj3_z(:,:,i) = obj3_z(:,:,i-1);
    obj4_z(:,:,i) = obj4_z(:,:,i-1);        
<<<<<<< HEAD
=======
    obj5_z(:,:,i) = obj5_z(:,:,i-1);  
    obj6_z(:,:,i) = obj6_z(:,:,i-1);  
    obj7_z(:,:,i) = obj7_z(:,:,i-1); 
>>>>>>> test
    
    % calculation visibility from our vehicle
    if sqrt(obj0_x(1, 1, i)^2 + obj0_y(1, 1, i)^2) < visibility
        vis_0(i) = 1;
    end
    if sqrt(obj1_x(1, 1, i)^2 + obj1_y(1, 1, i)^2) < visibility
        vis_1(i) = 1;
    end
    if sqrt(obj2_x(1, 1, i)^2 + obj2_y(1, 1, i)^2) < visibility
        vis_2(i) = 1;
    end
    if sqrt(obj3_x(1, 1, i)^2 + obj3_y(1, 1, i)^2) < visibility
        vis_3(i) = 1;
    end
    if sqrt(obj4_x(1, 1, i)^2 + obj4_y(1, 1, i)^2) < visibility
        vis_4(i) = 1;
    end
    if sqrt(obj5_x(1, 1, i)^2 + obj5_y(1, 1, i)^2) < visibility
        vis_5(i) = 1;
    end
    if sqrt(obj6_x(1, 1, i)^2 + obj6_y(1, 1, i)^2) < visibility
        vis_6(i) = 1;
    end
    if sqrt(obj7_x(1, 1, i)^2 + obj7_y(1, 1, i)^2) < visibility
        vis_7(i) = 1;
    end
end

% Saving generated data to structure which will be saved to .mat file and
% used in simulation
% Types: 1-car, 2-pedestrian, 3-sign, 4-building
<<<<<<< HEAD
object = struct('type', {1, 1, 1, 4, 2}, ...
    'x', {obj0_x, obj1_x, obj2_x, obj3_x, obj4_x}, ... 
    'y', {obj0_y, obj1_y, obj2_y, obj3_y, obj4_y}, ...
    'z', {obj0_z, obj1_z, obj2_z, obj3_z, obj4_z},...
    'speed', {tr1, -tr1*4, tr1*2, -tr1, tr1/2},...
    'visibility', {vis_0, vis_1, vis_2, vis_3, vis_4});
=======
object = struct('type', {1, 1, 1, 4, 2, 4, 5, 2}, ...
    'x', {obj0_x, obj1_x, obj2_x, obj3_x, obj4_x, obj5_x, obj6_x, obj7_x}, ... 
    'y', {obj0_y, obj1_y, obj2_y, obj3_y, obj4_y, obj5_y, obj6_y, obj7_y}, ...
    'z', {obj0_z, obj1_z, obj2_z, obj3_z, obj4_z, obj5_z, obj6_z, obj7_z}, ...
    'speed', {-tr1*1.1, tr1, tr1*1.2, -tr1, tr1/2, -tr1, -tr1*1.1, -tr1*1.1},...
    'visibility', {vis_0, vis_1, vis_2, vis_3, vis_4, vis_5, vis_6, vis_7});
>>>>>>> test

% Saving object to .mat file with time vector
save('dane.mat', 'object', 'time','x','y')
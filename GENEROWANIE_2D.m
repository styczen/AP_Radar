close all
clear all

% Input data generation
time=500; % simulation time
visibility = 1000; % for simulation to use less memory
tr1 = 1; % speed in regard to our vehicle

% road
p1 = -8.1949e-09
p2 = 6.6409e-06
p3 = -0.0016397
p4 = 0.1922
p5 = 0

x=0:time-1;
y = p1*x.^4 + p2*x.^3 +p3*x.^2 + p4*x + p5; 



% generation of clean matrices
obj0_x = zeros(2, 4, time);
obj0_y = zeros(2, 4, time);

obj1_x = zeros(2, 4, time);
obj1_y = zeros(2, 4, time);

obj2_x = zeros(2, 4, time);
obj2_y = zeros(2, 4, time);

obj3_x = zeros(2, 4, time);
obj3_y = zeros(2, 4, time);

obj4_x = zeros(2, 4, time); % pedestrian
obj4_y = zeros(2, 4, time); 

% starting positions
obj0_x(:,:,1) = [0, -1.7, -1.7, 0; ...
                -1.7, -1.7, 0, 0];
obj0_y(:,:,1) = [4 4 0 0; ...
                 4 0 0 4];
obj0_z(:,:,1) = 1.4;
             
obj1_x(:,:,1) = obj0_x(:,:,1)+2;
obj1_y(:,:,1) = obj0_y(:,:,1)+6;
obj1_z(:,:,1) = 1.4;

obj2_x(:,:,1) = obj0_x(:,:,1)+2;
obj2_y(:,:,1) = obj0_y(:,:,1)+15;
obj2_z(:,:,1) = 1.4;
             
obj3_x(:,:,1) = [-7 -3 -3 -7; ...
                 -3 -3 -7 -7];
obj3_y(:,:,1) = [10 10 20 20; ...
                 10 20 20 10];
obj3_z(:,:,1) = 1; % builiding

obj4_x(:,:,1) = [-5 -4 -4 -5; ...
                 -4 -4 -5 -5];
obj4_y(:,:,1) = [3 3 4 4; ...
                 3 4 4 3];
obj4_z(:,:,1) = 0.80; % pedestrian

% visibility vectors
vis_0=zeros(time, 1);
vis_1=zeros(time, 1);
vis_2=zeros(time, 1);
vis_3=zeros(time, 1); % building
vis_4=zeros(time, 1); % pedestrian


for i=2:time-4  
    % y - axis calculation
    obj0_y(:,:,i) = obj0_y(:,:,i-1) + tr1*1.1; 
    obj1_y(:,:,i) = obj1_y(:,:,i-1) + tr1;
    obj2_y(:,:,i) = obj2_y(:,:,i-1) + tr1*1.2;
    obj3_y(:,:,i) = obj3_y(:,:,i-1) - tr1; % building
    obj4_y(:,:,i) = obj4_y(:,:,i-1) + tr1/2; % pedestrian
 
    % x - axis calculation    
    y00= p1*obj0_y(:,:,i).^4 + p2*obj0_y(:,:,i).^3 +p3*obj0_y(:,:,i).^2 + p4*obj0_y(:,:,i);
    y01= p1*obj1_y(:,:,i).^4 + p2*obj1_y(:,:,i).^3 +p3*obj1_y(:,:,i).^2 + p4*obj1_y(:,:,i);
    y02= p1*obj2_y(:,:,i).^4 + p2*obj2_y(:,:,i).^3 +p3*obj2_y(:,:,i).^2 + p4*obj2_y(:,:,i);
    y03= p1*obj3_y(:,:,i).^4 + p2*obj3_y(:,:,i).^3 +p3*obj3_y(:,:,i).^2 + p4*obj3_y(:,:,i);
    y04= p1*obj4_y(:,:,i).^4 + p2*obj4_y(:,:,i).^3 +p3*obj4_y(:,:,i).^2 + p4*obj4_y(:,:,i);
    
    obj0_x(:,:,i) = obj0_x(:,:,1)+y00; 
    obj1_x(:,:,i) = obj1_x(:,:,1)+y01;
    obj2_x(:,:,i) = obj2_x(:,:,1)+y02;
    obj3_x(:,:,i) = obj3_x(:,:,1)+y03; % building
    obj4_x(:,:,i) = obj4_x(:,:,1)+y04; % pedestrian
    
    % z - axis calculation
    obj0_z(:,:,i) = obj0_z(:,:,i-1); 
    obj1_z(:,:,i) = obj1_z(:,:,i-1);
    obj2_z(:,:,i) = obj2_z(:,:,i-1);
    obj3_z(:,:,i) = obj3_z(:,:,i-1);
    obj4_z(:,:,i) = obj4_z(:,:,i-1);        
    
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
end

% Saving generated data to structure which will be saved to .mat file and
% used in simulation
% Types: 1-car, 2-pedestrian, 3-sign, 4-building
object = struct('type', {1, 1, 1, 4, 2}, ...
    'x', {obj0_x, obj1_x, obj2_x, obj3_x, obj4_x}, ... 
    'y', {obj0_y, obj1_y, obj2_y, obj3_y, obj4_y}, ...
    'z', {obj0_z, obj1_z, obj2_z, obj3_z, obj4_z}, ...
    'speed', {tr1, -tr1*4, tr1*2, -tr1, tr1/2, },...
    'visibility', {vis_0, vis_1, vis_2, vis_3, vis_4});

% Saving object to .mat file with time vector
save('dane.mat', 'object', 'time','x','y')
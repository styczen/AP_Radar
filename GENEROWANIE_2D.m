close all
clear all

% Input data generation
time = 500; % simulation time
visibility = 5000; % for simulation to use less memory
tr1 = 1; % speed in regard to our vehicle

% road A
p1 = -8.1949e-09;
p2 = 6.6409e-06;
p3 = -0.0016397;
p4 = 0.1922;
p5 = 0;

% road B
% p1 = -5.1073e-10;
% p2 = 1.5322e-06;
% p3 = -0.0014206;
% p4 = 0.40715;
% p5 = 0;

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


% BUDYNKI PO PRAWEJ STRONIE

obj8_x(:,:,1) = [8 4 4 8];
obj8_y(:,:,1) = [23 23 34 34];
obj8_z(:,:,1) = 5; % builiding

obj9_x(:,:,1) = [9 4 4 9];
obj9_y(:,:,1) = [35 35 40 40];
obj9_z(:,:,1) = 5; % builiding

obj10_x(:,:,1) = [12 3 3 12];
obj10_y(:,:,1) = [55 55 65 65];
obj10_z(:,:,1) = 5; % builiding

obj11_x(:,:,1) = [13.5 4 4 13.5];
obj11_y(:,:,1) = [55 55 65 65];
obj11_z(:,:,1) = 4; % builiding

obj12_x(:,:,1) = [13 5 5 13];
obj12_y(:,:,1) = [80 80 100 100];
obj12_z(:,:,1) = 4; % builiding

obj13_x(:,:,1) = [15 4 4 15];
obj13_y(:,:,1) = [120 120 135 135];
obj13_z(:,:,1) = 4; % builiding

obj14_x(:,:,1) = [12 4 4 12];
obj14_y(:,:,1) = [150 150 160 160];
obj14_z(:,:,1) = 4; % builiding

obj15_x(:,:,1) = [8 4 4 8];
obj15_y(:,:,1) = [162 162 170 170];
obj15_z(:,:,1) = 4; % builiding

obj16_x(:,:,1) = [10 4 4 10];
obj16_y(:,:,1) = [180 180 195 195];
obj16_z(:,:,1) = 4; % builiding

obj17_x(:,:,1) = [8 3 3 8];
obj17_y(:,:,1) = [200 200 225 225];
obj17_z(:,:,1) = 4; % builiding

obj18_x(:,:,1) = [10 4 4 10];
obj18_y(:,:,1) = [227 227 235 235];
obj18_z(:,:,1) = 4; % builiding

obj19_x(:,:,1) = [10 4 4 10];
obj19_y(:,:,1) = [250 250 265 265];
obj19_z(:,:,1) = 4; % builiding

obj20_x(:,:,1) = [10 4 4 10];
obj20_y(:,:,1) = [270 270 290 290];
obj20_z(:,:,1) = 5; % builiding

obj21_x(:,:,1) = [12 4 4 12];
obj21_y(:,:,1) = [295 295 305 305];
obj21_z(:,:,1) = 4; % builiding

obj21_x(:,:,1) = [12 4 4 12];
obj21_y(:,:,1) = [330 330 350 350];
obj21_z(:,:,1) = 3; % builiding

obj22_x(:,:,1) = [8 3 3 8];
obj22_y(:,:,1) = [360 360 385 385];
obj22_z(:,:,1) = 3; % builiding

obj23_x(:,:,1) = [10 4 4 10];
obj23_y(:,:,1) = [388 388 396 396];
obj23_z(:,:,1) = 4; % builiding

obj24_x(:,:,1) = [9 4 4 9];
obj24_y(:,:,1) = [400 400 415 415];
obj24_z(:,:,1) = 5; % builiding

obj25_x(:,:,1) = [11 4 4 11];
obj25_y(:,:,1) = [430 430 455 455];
obj25_z(:,:,1) = 4; % builiding

obj26_x(:,:,1) = [10 4 4 10];
obj26_y(:,:,1) = [459 459 470 470];
obj26_z(:,:,1) = 3; % builiding

obj27_x(:,:,1) = [10 3 3 10];
obj27_y(:,:,1) = [475 475 485 485];
obj27_z(:,:,1) = 5; % builiding

obj28_x(:,:,1) = [7 4 4 7];
obj28_y(:,:,1) = [490 490 515 515];
obj28_z(:,:,1) = 4; % builiding

obj29_x(:,:,1) = [7 3 3 7];
obj29_y(:,:,1) = [525 525 535 535];
obj29_z(:,:,1) = 4; % builiding

obj30_x(:,:,1) = [10 3 3 10];
obj30_y(:,:,1) = [540 540 550 550];
obj30_z(:,:,1) = 3; % builiding

obj31_x(:,:,1) = [6 3 3 6];
obj31_y(:,:,1) = [552 552 560 560];
obj31_z(:,:,1) = 4; % builiding

obj32_x(:,:,1) = [6 3 3 6];
obj32_y(:,:,1) = [562 562 570 570];
obj32_z(:,:,1) = 3; % builiding

obj33_x(:,:,1) = [6 3 3 6];
obj33_y(:,:,1) = [575 575 585 585];
obj33_z(:,:,1) = 5; % builiding

obj34_x(:,:,1) = [9 3 3 9];
obj34_y(:,:,1) = [600 600 606 606];
obj34_z(:,:,1) = 3; % builiding

% BUDYNKI PO LEWEJ STRONIE


obj35_x(:,:,1) = [-4 -10 -10 -4];
obj35_y(:,:,1) = [23 23 34 34];
obj35_z(:,:,1) = 3; % builiding

obj36_x(:,:,1) = [-3 -9 -9 -3];
obj36_y(:,:,1) = [35 35 40 40];
obj36_z(:,:,1) = 5; % builiding

obj37_x(:,:,1) = [-3 -10 -10 -3];
obj37_y(:,:,1) = [55 55 65 65];
obj37_z(:,:,1) = 5; % builiding

obj38_x(:,:,1) = [-3 -8 -8 -3];
obj38_y(:,:,1) = [55 55 65 65];
obj38_z(:,:,1) = 4; % builiding

obj39_x(:,:,1) = [-3 -6 -6 -3];
obj39_y(:,:,1) = [80 80 100 100];
obj39_z(:,:,1) = 3; % builiding

obj40_x(:,:,1) = [-4 -7 -7 -4];
obj40_y(:,:,1) = [120 120 135 135];
obj40_z(:,:,1) = 3; % builiding

obj41_x(:,:,1) = [-4 -8 -8 -4];
obj41_y(:,:,1) = [150 150 160 160];
obj41_z(:,:,1) = 4; % builiding

obj42_x(:,:,1) = [-4 -7 -7 -4];
obj42_y(:,:,1) = [162 162 170 170];
obj42_z(:,:,1) = 3; % builiding

obj43_x(:,:,1) = [-4 -10 -10 -4];
obj43_y(:,:,1) = [180 180 195 195];
obj43_z(:,:,1) = 5; % builiding

obj44_x(:,:,1) = [-3 -9 -9 -3];
obj44_y(:,:,1) = [200 200 225 225];
obj44_z(:,:,1) = 5; % builiding

obj45_x(:,:,1) = [-4 -9 -9 -4];
obj45_y(:,:,1) = [227 227 235 235];
obj45_z(:,:,1) = 4; % builiding

obj46_x(:,:,1) = [-3 -9 -9 -3];
obj46_y(:,:,1) = [250 250 265 265];
obj46_z(:,:,1) = 4; % builiding

obj47_x(:,:,1) = [-3 -10 -10 -3];
obj47_y(:,:,1) = [270 270 290 290];
obj47_z(:,:,1) = 3; % builiding

obj48_x(:,:,1) = [-3 -9 -9 -3];
obj48_y(:,:,1) = [295 295 305 305];
obj48_z(:,:,1) = 3; % builiding

obj49_x(:,:,1) = [-3 -8 -8 -3];
obj49_y(:,:,1) = [330 330 350 350];
obj49_z(:,:,1) = 4; % builiding

obj50_x(:,:,1) = [-4 -10 -10 -4];
obj50_y(:,:,1) = [360 360 385 385];
obj50_z(:,:,1) = 3; % builiding

obj51_x(:,:,1) = [-4 -7 -7 -4];
obj51_y(:,:,1) = [388 388 396 396];
obj51_z(:,:,1) = 5; % builiding

obj52_x(:,:,1) = [-4 -8 -8 -4];
obj52_y(:,:,1) = [400 400 415 415];
obj52_z(:,:,1) = 4; % builiding

obj53_x(:,:,1) = [-4 -9 -9 -4];
obj53_y(:,:,1) = [430 430 455 455];
obj53_z(:,:,1) = 5; % builiding

obj54_x(:,:,1) = [-3 -8 -8 -3];
obj54_y(:,:,1) = [459 459 470 470];
obj54_z(:,:,1) = 4; % builiding

obj55_x(:,:,1) = [-4 -8 -8 -4];
obj55_y(:,:,1) = [475 475 485 485];
obj55_z(:,:,1) = 3; % builiding

obj56_x(:,:,1) = [-4 -9 -9 -4];
obj56_y(:,:,1) = [490 490 515 515];
obj56_z(:,:,1) = 5; % builiding

obj57_x(:,:,1) = [-3 -10 -10 -3];
obj57_y(:,:,1) = [525 525 535 535];
obj57_z(:,:,1) = 4; % builiding

obj58_x(:,:,1) = [-3 -9 -9 -3];
obj58_y(:,:,1) = [540 540 550 550];
obj58_z(:,:,1) = 4; % builiding

obj59_x(:,:,1) = [-3 -8 -8 -3];
obj59_y(:,:,1) = [552 552 560 560];
obj59_z(:,:,1) = 5; % builiding

obj60_x(:,:,1) = [-4 -7 -7 -4];
obj60_y(:,:,1) = [562 562 570 570];
obj60_z(:,:,1) = 3; % builiding

obj61_x(:,:,1) = [-3 -8 -8 -3];
obj61_y(:,:,1) = [575 575 585 585];
obj61_z(:,:,1) = 3; % builiding

obj62_x(:,:,1) = [-4 -10 -10 -4];
obj62_y(:,:,1) = [600 600 606 606];
obj62_z(:,:,1) = 4; % builiding


% visibility vectors
vis_0=zeros(time, 1);
vis_1=zeros(time, 1);
vis_2=zeros(time, 1);
vis_3=zeros(time, 1); % building
vis_4=zeros(time, 1); % pedestrian
vis_5=zeros(time, 1); % building
vis_6=zeros(time, 1); % car
vis_7=zeros(time, 1); % car

vis_8=zeros(time, 1); % building
vis_9=zeros(time, 1); % building
vis_10=zeros(time, 1); % building
vis_11=zeros(time, 1); % building
vis_12=zeros(time, 1); % building
vis_13=zeros(time, 1); % building
vis_14=zeros(time, 1); % building
vis_15=zeros(time, 1); % building
vis_16=zeros(time, 1); % building
vis_17=zeros(time, 1); % building
vis_18=zeros(time, 1); % building
vis_19=zeros(time, 1); % building
vis_20=zeros(time, 1); % building
vis_21=zeros(time, 1); % building
vis_22=zeros(time, 1); % building
vis_23=zeros(time, 1); % building
vis_24=zeros(time, 1); % building
vis_25=zeros(time, 1); % building
vis_26=zeros(time, 1); % building
vis_27=zeros(time, 1); % building
vis_28=zeros(time, 1); % building
vis_29=zeros(time, 1); % building
vis_30=zeros(time, 1); % building
vis_31=zeros(time, 1); % building
vis_32=zeros(time, 1); % building
vis_33=zeros(time, 1); % building
vis_34=zeros(time, 1); % building
vis_35=zeros(time, 1); % building
vis_36=zeros(time, 1); % building
vis_37=zeros(time, 1); % building
vis_38=zeros(time, 1); % building
vis_39=zeros(time, 1); % building
vis_40=zeros(time, 1); % building
vis_41=zeros(time, 1); % building
vis_42=zeros(time, 1); % building
vis_43=zeros(time, 1); % building
vis_44=zeros(time, 1); % building
vis_45=zeros(time, 1); % building
vis_46=zeros(time, 1); % building
vis_47=zeros(time, 1); % building
vis_48=zeros(time, 1); % building
vis_49=zeros(time, 1); % building
vis_50=zeros(time, 1); % building
vis_51=zeros(time, 1); % building
vis_52=zeros(time, 1); % building
vis_53=zeros(time, 1); % building
vis_54=zeros(time, 1); % building
vis_55=zeros(time, 1); % building
vis_56=zeros(time, 1); % building
vis_57=zeros(time, 1); % building
vis_58=zeros(time, 1); % building
vis_59=zeros(time, 1); % building
vis_60=zeros(time, 1); % building
vis_61=zeros(time, 1); % building
vis_62=zeros(time, 1); % building

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
    
    obj8_y(:,:,i) = obj8_y(:,:,i-1) - tr1; % building
    obj9_y(:,:,i) = obj9_y(:,:,i-1) - tr1; % building
    obj10_y(:,:,i) = obj10_y(:,:,i-1) - tr1; % building
    obj11_y(:,:,i) = obj11_y(:,:,i-1) - tr1; % building
    obj12_y(:,:,i) = obj12_y(:,:,i-1) - tr1; % building
    obj13_y(:,:,i) = obj13_y(:,:,i-1) - tr1; % building
    obj14_y(:,:,i) = obj14_y(:,:,i-1) - tr1; % building
    obj15_y(:,:,i) = obj15_y(:,:,i-1) - tr1; % building
    obj16_y(:,:,i) = obj16_y(:,:,i-1) - tr1; % building
    obj17_y(:,:,i) = obj17_y(:,:,i-1) - tr1; % building
    obj18_y(:,:,i) = obj18_y(:,:,i-1) - tr1; % building
    obj19_y(:,:,i) = obj19_y(:,:,i-1) - tr1; % building
    obj20_y(:,:,i) = obj20_y(:,:,i-1) - tr1; % building
    obj21_y(:,:,i) = obj21_y(:,:,i-1) - tr1; % building
    obj22_y(:,:,i) = obj22_y(:,:,i-1) - tr1; % building
    obj23_y(:,:,i) = obj23_y(:,:,i-1) - tr1; % building
    obj24_y(:,:,i) = obj24_y(:,:,i-1) - tr1; % building
    obj25_y(:,:,i) = obj25_y(:,:,i-1) - tr1; % building
    obj26_y(:,:,i) = obj26_y(:,:,i-1) - tr1; % building
    obj27_y(:,:,i) = obj27_y(:,:,i-1) - tr1; % building
    obj28_y(:,:,i) = obj28_y(:,:,i-1) - tr1; % building
    obj29_y(:,:,i) = obj29_y(:,:,i-1) - tr1; % building
    obj30_y(:,:,i) = obj30_y(:,:,i-1) - tr1; % building
    obj31_y(:,:,i) = obj31_y(:,:,i-1) - tr1; % building
    obj32_y(:,:,i) = obj32_y(:,:,i-1) - tr1; % building
    obj33_y(:,:,i) = obj33_y(:,:,i-1) - tr1; % building
    obj34_y(:,:,i) = obj34_y(:,:,i-1) - tr1; % building
    obj35_y(:,:,i) = obj35_y(:,:,i-1) - tr1; % building
    obj36_y(:,:,i) = obj36_y(:,:,i-1) - tr1; 
    obj37_y(:,:,i) = obj37_y(:,:,i-1) - tr1; 
    obj38_y(:,:,i) = obj38_y(:,:,i-1) - tr1; % building
    obj39_y(:,:,i) = obj39_y(:,:,i-1) - tr1; % building
    obj40_y(:,:,i) = obj40_y(:,:,i-1) - tr1; % building
    obj41_y(:,:,i) = obj41_y(:,:,i-1) - tr1; % building
    obj42_y(:,:,i) = obj42_y(:,:,i-1) - tr1; % building
    obj43_y(:,:,i) = obj43_y(:,:,i-1) - tr1; % building
    obj44_y(:,:,i) = obj44_y(:,:,i-1) - tr1; % building
    obj45_y(:,:,i) = obj45_y(:,:,i-1) - tr1; % building
    obj46_y(:,:,i) = obj46_y(:,:,i-1) - tr1; 
    obj47_y(:,:,i) = obj47_y(:,:,i-1) - tr1; 
    obj48_y(:,:,i) = obj48_y(:,:,i-1) - tr1; % building
    obj49_y(:,:,i) = obj49_y(:,:,i-1) - tr1; % building
    obj50_y(:,:,i) = obj50_y(:,:,i-1) - tr1; % building
    obj51_y(:,:,i) = obj51_y(:,:,i-1) - tr1; % building
    obj52_y(:,:,i) = obj52_y(:,:,i-1) - tr1; % building
    obj53_y(:,:,i) = obj53_y(:,:,i-1) - tr1; % building
    obj54_y(:,:,i) = obj54_y(:,:,i-1) - tr1; % building
    obj55_y(:,:,i) = obj55_y(:,:,i-1) - tr1; % building
    obj56_y(:,:,i) = obj56_y(:,:,i-1) - tr1; 
    obj57_y(:,:,i) = obj57_y(:,:,i-1) - tr1; 
    obj58_y(:,:,i) = obj58_y(:,:,i-1) - tr1; % building
    obj59_y(:,:,i) = obj59_y(:,:,i-1) - tr1; % building
    obj60_y(:,:,i) = obj60_y(:,:,i-1) - tr1; % building
    obj61_y(:,:,i) = obj61_y(:,:,i-1) - tr1; % building
    obj62_y(:,:,i) = obj62_y(:,:,i-1) - tr1; % building
    
    % x - axis calculation    
    y00= p1*obj0_y(:,:,i).^4 + p2*obj0_y(:,:,i).^3 +p3*obj0_y(:,:,i).^2 + p4*obj0_y(:,:,i);
    y01= p1*obj1_y(:,:,i).^4 + p2*obj1_y(:,:,i).^3 +p3*obj1_y(:,:,i).^2 + p4*obj1_y(:,:,i);
    y02= p1*obj2_y(:,:,i).^4 + p2*obj2_y(:,:,i).^3 +p3*obj2_y(:,:,i).^2 + p4*obj2_y(:,:,i);
    y03= p1*obj3_y(:,:,i).^4 + p2*obj3_y(:,:,i).^3 +p3*obj3_y(:,:,i).^2 + p4*obj3_y(:,:,i);
    y04= p1*obj4_y(:,:,i).^4 + p2*obj4_y(:,:,i).^3 +p3*obj4_y(:,:,i).^2 + p4*obj4_y(:,:,i);
    y05= p1*obj5_y(:,:,i).^4 + p2*obj5_y(:,:,i).^3 +p3*obj5_y(:,:,i).^2 + p4*obj5_y(:,:,i);
    y06= p1*obj6_y(:,:,i).^4 + p2*obj6_y(:,:,i).^3 +p3*obj6_y(:,:,i).^2 + p4*obj6_y(:,:,i);
    y07= p1*obj7_y(:,:,i).^4 + p2*obj7_y(:,:,i).^3 +p3*obj7_y(:,:,i).^2 + p4*obj7_y(:,:,i);
    
    y08= p1*obj8_y(:,:,i).^4 + p2*obj8_y(:,:,i).^3 +p3*obj8_y(:,:,i).^2 + p4*obj8_y(:,:,i);
    y09= p1*obj9_y(:,:,i).^4 + p2*obj9_y(:,:,i).^3 +p3*obj9_y(:,:,i).^2 + p4*obj9_y(:,:,i);
    y010= p1*obj10_y(:,:,i).^4 + p2*obj10_y(:,:,i).^3 +p3*obj10_y(:,:,i).^2 + p4*obj10_y(:,:,i);
    y011= p1*obj11_y(:,:,i).^4 + p2*obj11_y(:,:,i).^3 +p3*obj11_y(:,:,i).^2 + p4*obj11_y(:,:,i);
    y012= p1*obj12_y(:,:,i).^4 + p2*obj12_y(:,:,i).^3 +p3*obj12_y(:,:,i).^2 + p4*obj12_y(:,:,i);
    y013= p1*obj13_y(:,:,i).^4 + p2*obj13_y(:,:,i).^3 +p3*obj13_y(:,:,i).^2 + p4*obj13_y(:,:,i);
    y014= p1*obj14_y(:,:,i).^4 + p2*obj14_y(:,:,i).^3 +p3*obj14_y(:,:,i).^2 + p4*obj14_y(:,:,i);
    y015= p1*obj15_y(:,:,i).^4 + p2*obj15_y(:,:,i).^3 +p3*obj15_y(:,:,i).^2 + p4*obj15_y(:,:,i);
    y016= p1*obj16_y(:,:,i).^4 + p2*obj16_y(:,:,i).^3 +p3*obj16_y(:,:,i).^2 + p4*obj16_y(:,:,i);
    y017= p1*obj17_y(:,:,i).^4 + p2*obj17_y(:,:,i).^3 +p3*obj17_y(:,:,i).^2 + p4*obj17_y(:,:,i);
    y018= p1*obj18_y(:,:,i).^4 + p2*obj18_y(:,:,i).^3 +p3*obj18_y(:,:,i).^2 + p4*obj18_y(:,:,i);
    y019= p1*obj19_y(:,:,i).^4 + p2*obj19_y(:,:,i).^3 +p3*obj19_y(:,:,i).^2 + p4*obj19_y(:,:,i);
    y020= p1*obj20_y(:,:,i).^4 + p2*obj20_y(:,:,i).^3 +p3*obj20_y(:,:,i).^2 + p4*obj20_y(:,:,i);
    y021= p1*obj21_y(:,:,i).^4 + p2*obj21_y(:,:,i).^3 +p3*obj21_y(:,:,i).^2 + p4*obj21_y(:,:,i);
    y022= p1*obj22_y(:,:,i).^4 + p2*obj22_y(:,:,i).^3 +p3*obj22_y(:,:,i).^2 + p4*obj22_y(:,:,i);
    y023= p1*obj23_y(:,:,i).^4 + p2*obj23_y(:,:,i).^3 +p3*obj23_y(:,:,i).^2 + p4*obj23_y(:,:,i);
    y024= p1*obj24_y(:,:,i).^4 + p2*obj24_y(:,:,i).^3 +p3*obj24_y(:,:,i).^2 + p4*obj24_y(:,:,i);
    y025= p1*obj25_y(:,:,i).^4 + p2*obj25_y(:,:,i).^3 +p3*obj25_y(:,:,i).^2 + p4*obj25_y(:,:,i);
    y026= p1*obj26_y(:,:,i).^4 + p2*obj26_y(:,:,i).^3 +p3*obj26_y(:,:,i).^2 + p4*obj26_y(:,:,i);
    y027= p1*obj27_y(:,:,i).^4 + p2*obj27_y(:,:,i).^3 +p3*obj27_y(:,:,i).^2 + p4*obj27_y(:,:,i);
    y028= p1*obj28_y(:,:,i).^4 + p2*obj28_y(:,:,i).^3 +p3*obj28_y(:,:,i).^2 + p4*obj28_y(:,:,i);
    y029= p1*obj29_y(:,:,i).^4 + p2*obj29_y(:,:,i).^3 +p3*obj29_y(:,:,i).^2 + p4*obj29_y(:,:,i);
    y030= p1*obj30_y(:,:,i).^4 + p2*obj30_y(:,:,i).^3 +p3*obj30_y(:,:,i).^2 + p4*obj30_y(:,:,i);
    y031= p1*obj31_y(:,:,i).^4 + p2*obj31_y(:,:,i).^3 +p3*obj31_y(:,:,i).^2 + p4*obj31_y(:,:,i);
    y032= p1*obj32_y(:,:,i).^4 + p2*obj32_y(:,:,i).^3 +p3*obj32_y(:,:,i).^2 + p4*obj32_y(:,:,i);
    y033= p1*obj33_y(:,:,i).^4 + p2*obj33_y(:,:,i).^3 +p3*obj33_y(:,:,i).^2 + p4*obj33_y(:,:,i);
    y034= p1*obj34_y(:,:,i).^4 + p2*obj34_y(:,:,i).^3 +p3*obj34_y(:,:,i).^2 + p4*obj34_y(:,:,i);
    y035= p1*obj35_y(:,:,i).^4 + p2*obj35_y(:,:,i).^3 +p3*obj35_y(:,:,i).^2 + p4*obj35_y(:,:,i);
    y036= p1*obj36_y(:,:,i).^4 + p2*obj36_y(:,:,i).^3 +p3*obj36_y(:,:,i).^2 + p4*obj36_y(:,:,i);
    y037= p1*obj37_y(:,:,i).^4 + p2*obj37_y(:,:,i).^3 +p3*obj37_y(:,:,i).^2 + p4*obj37_y(:,:,i);
    y038= p1*obj38_y(:,:,i).^4 + p2*obj38_y(:,:,i).^3 +p3*obj38_y(:,:,i).^2 + p4*obj38_y(:,:,i);
    y039= p1*obj39_y(:,:,i).^4 + p2*obj39_y(:,:,i).^3 +p3*obj39_y(:,:,i).^2 + p4*obj39_y(:,:,i);
    y040= p1*obj40_y(:,:,i).^4 + p2*obj40_y(:,:,i).^3 +p3*obj40_y(:,:,i).^2 + p4*obj40_y(:,:,i);
    y041= p1*obj41_y(:,:,i).^4 + p2*obj41_y(:,:,i).^3 +p3*obj41_y(:,:,i).^2 + p4*obj41_y(:,:,i);
    y042= p1*obj42_y(:,:,i).^4 + p2*obj42_y(:,:,i).^3 +p3*obj42_y(:,:,i).^2 + p4*obj42_y(:,:,i);
    y043= p1*obj43_y(:,:,i).^4 + p2*obj43_y(:,:,i).^3 +p3*obj43_y(:,:,i).^2 + p4*obj43_y(:,:,i);
    y044= p1*obj44_y(:,:,i).^4 + p2*obj44_y(:,:,i).^3 +p3*obj44_y(:,:,i).^2 + p4*obj44_y(:,:,i);
    y045= p1*obj45_y(:,:,i).^4 + p2*obj45_y(:,:,i).^3 +p3*obj45_y(:,:,i).^2 + p4*obj45_y(:,:,i);
    y046= p1*obj46_y(:,:,i).^4 + p2*obj46_y(:,:,i).^3 +p3*obj46_y(:,:,i).^2 + p4*obj46_y(:,:,i);
    y047= p1*obj47_y(:,:,i).^4 + p2*obj47_y(:,:,i).^3 +p3*obj47_y(:,:,i).^2 + p4*obj47_y(:,:,i);
    y048= p1*obj48_y(:,:,i).^4 + p2*obj48_y(:,:,i).^3 +p3*obj48_y(:,:,i).^2 + p4*obj48_y(:,:,i);
    y049= p1*obj49_y(:,:,i).^4 + p2*obj49_y(:,:,i).^3 +p3*obj49_y(:,:,i).^2 + p4*obj49_y(:,:,i);
    y050= p1*obj50_y(:,:,i).^4 + p2*obj50_y(:,:,i).^3 +p3*obj50_y(:,:,i).^2 + p4*obj50_y(:,:,i);
    y051= p1*obj51_y(:,:,i).^4 + p2*obj51_y(:,:,i).^3 +p3*obj51_y(:,:,i).^2 + p4*obj51_y(:,:,i);
    y052= p1*obj52_y(:,:,i).^4 + p2*obj52_y(:,:,i).^3 +p3*obj52_y(:,:,i).^2 + p4*obj52_y(:,:,i);
    y053= p1*obj53_y(:,:,i).^4 + p2*obj53_y(:,:,i).^3 +p3*obj53_y(:,:,i).^2 + p4*obj53_y(:,:,i);
    y054= p1*obj54_y(:,:,i).^4 + p2*obj54_y(:,:,i).^3 +p3*obj54_y(:,:,i).^2 + p4*obj54_y(:,:,i);
    y055= p1*obj55_y(:,:,i).^4 + p2*obj55_y(:,:,i).^3 +p3*obj55_y(:,:,i).^2 + p4*obj55_y(:,:,i);
    y056= p1*obj56_y(:,:,i).^4 + p2*obj56_y(:,:,i).^3 +p3*obj56_y(:,:,i).^2 + p4*obj56_y(:,:,i);
    y057= p1*obj57_y(:,:,i).^4 + p2*obj57_y(:,:,i).^3 +p3*obj57_y(:,:,i).^2 + p4*obj57_y(:,:,i);
    y058= p1*obj58_y(:,:,i).^4 + p2*obj58_y(:,:,i).^3 +p3*obj58_y(:,:,i).^2 + p4*obj58_y(:,:,i);
    y059= p1*obj59_y(:,:,i).^4 + p2*obj59_y(:,:,i).^3 +p3*obj59_y(:,:,i).^2 + p4*obj59_y(:,:,i);
    y060= p1*obj60_y(:,:,i).^4 + p2*obj60_y(:,:,i).^3 +p3*obj60_y(:,:,i).^2 + p4*obj60_y(:,:,i);
    y061= p1*obj61_y(:,:,i).^4 + p2*obj61_y(:,:,i).^3 +p3*obj61_y(:,:,i).^2 + p4*obj61_y(:,:,i);
    y062= p1*obj62_y(:,:,i).^4 + p2*obj62_y(:,:,i).^3 +p3*obj52_y(:,:,i).^2 + p4*obj62_y(:,:,i);
    
    obj0_x(:,:,i) = obj0_x(:,:,1)+y00; % car
    obj1_x(:,:,i) = obj1_x(:,:,1)+y01; % car
    obj2_x(:,:,i) = obj2_x(:,:,1)+y02; % car
    obj3_x(:,:,i) = obj3_x(:,:,1)+y03; % building
    obj4_x(:,:,i) = obj4_x(:,:,1)+y04; % pedestrian
    obj5_x(:,:,i) = obj5_x(:,:,1)+y05; % building
    obj6_x(:,:,i) = y06-[2 0 0 2]; % car
    obj7_x(:,:,i) = y07-[2 0 0 2]; % car
    
    obj8_x(:,:,i) = obj8_x(:,:,1)+y08; % building
    obj9_x(:,:,i) = obj9_x(:,:,1)+y09; % building
    obj10_x(:,:,i) = obj10_x(:,:,1)+y010; % building
    obj11_x(:,:,i) = obj11_x(:,:,1)+y011; % building
    obj12_x(:,:,i) = obj12_x(:,:,1)+y012; % building
    obj13_x(:,:,i) = obj13_x(:,:,1)+y013; % building
    obj14_x(:,:,i) = obj14_x(:,:,1)+y014; % building
    obj15_x(:,:,i) = obj15_x(:,:,1)+y015; % building
    obj16_x(:,:,i) = obj16_x(:,:,1)+y016; % building
    obj17_x(:,:,i) = obj17_x(:,:,1)+y017; % building
    obj18_x(:,:,i) = obj18_x(:,:,1)+y018; % building
    obj19_x(:,:,i) = obj19_x(:,:,1)+y019; % building
    obj20_x(:,:,i) = obj20_x(:,:,1)+y020; % building
    obj21_x(:,:,i) = obj21_x(:,:,1)+y021; % building
    obj22_x(:,:,i) = obj22_x(:,:,1)+y022; % building
    obj23_x(:,:,i) = obj23_x(:,:,1)+y023; % building
    obj24_x(:,:,i) = obj24_x(:,:,1)+y024; % building
    obj25_x(:,:,i) = obj25_x(:,:,1)+y025; % building
    obj26_x(:,:,i) = obj26_x(:,:,1)+y026; % building
    obj27_x(:,:,i) = obj27_x(:,:,1)+y027; % building
    obj28_x(:,:,i) = obj28_x(:,:,1)+y028; % building
    obj29_x(:,:,i) = obj29_x(:,:,1)+y029; % building
    obj30_x(:,:,i) = obj30_x(:,:,1)+y030; % building
    obj31_x(:,:,i) = obj31_x(:,:,1)+y031; % building
    obj32_x(:,:,i) = obj32_x(:,:,1)+y032; % building
    obj33_x(:,:,i) = obj33_x(:,:,1)+y033; % building
    obj34_x(:,:,i) = obj34_x(:,:,1)+y034; % building
    obj35_x(:,:,i) = obj35_x(:,:,1)+y035; % building
    obj36_x(:,:,i) = obj36_x(:,:,1)+y036; % building
    obj37_x(:,:,i) = obj37_x(:,:,1)+y037; % building
    obj38_x(:,:,i) = obj38_x(:,:,1)+y038; % building
    obj39_x(:,:,i) = obj39_x(:,:,1)+y039; % building
    obj40_x(:,:,i) = obj40_x(:,:,1)+y040; % building
    obj41_x(:,:,i) = obj41_x(:,:,1)+y041; % building
    obj42_x(:,:,i) = obj42_x(:,:,1)+y042; % building
    obj43_x(:,:,i) = obj43_x(:,:,1)+y043; % building
    obj44_x(:,:,i) = obj44_x(:,:,1)+y044; % building
    obj45_x(:,:,i) = obj45_x(:,:,1)+y045; % building
    obj46_x(:,:,i) = obj46_x(:,:,1)+y046; % building
    obj47_x(:,:,i) = obj47_x(:,:,1)+y047; % building
    obj48_x(:,:,i) = obj48_x(:,:,1)+y048; % building
    obj49_x(:,:,i) = obj49_x(:,:,1)+y049; % building
    obj50_x(:,:,i) = obj50_x(:,:,1)+y050; % building
    obj51_x(:,:,i) = obj51_x(:,:,1)+y051; % building
    obj52_x(:,:,i) = obj52_x(:,:,1)+y052; % building
    obj53_x(:,:,i) = obj53_x(:,:,1)+y053; % building
    obj54_x(:,:,i) = obj54_x(:,:,1)+y054; % building
    obj55_x(:,:,i) = obj55_x(:,:,1)+y055; % building
    obj56_x(:,:,i) = obj56_x(:,:,1)+y056; % building
    obj57_x(:,:,i) = obj57_x(:,:,1)+y057; % building
    obj58_x(:,:,i) = obj58_x(:,:,1)+y058; % building
    obj59_x(:,:,i) = obj59_x(:,:,1)+y059; % building
    obj60_x(:,:,i) = obj60_x(:,:,1)+y060; % building
    obj61_x(:,:,i) = obj61_x(:,:,1)+y061; % building
    obj62_x(:,:,i) = obj62_x(:,:,1)+y062; % building
    
    % z - axis calculation
    obj0_z(:,:,i) = obj0_z(:,:,i-1); 
    obj1_z(:,:,i) = obj1_z(:,:,i-1);
    obj2_z(:,:,i) = obj2_z(:,:,i-1);
    obj3_z(:,:,i) = obj3_z(:,:,i-1);
    obj4_z(:,:,i) = obj4_z(:,:,i-1);        
    obj5_z(:,:,i) = obj5_z(:,:,i-1);  
    obj6_z(:,:,i) = obj6_z(:,:,i-1);  
    obj7_z(:,:,i) = obj7_z(:,:,i-1); 

    obj8_z(:,:,i) = obj8_z(:,:,i-1); 
    obj9_z(:,:,i) = obj9_z(:,:,i-1);
    obj10_z(:,:,i) = obj10_z(:,:,i-1); 
    obj11_z(:,:,i) = obj11_z(:,:,i-1);
    obj12_z(:,:,i) = obj12_z(:,:,i-1); 
    obj13_z(:,:,i) = obj13_z(:,:,i-1);
    obj14_z(:,:,i) = obj14_z(:,:,i-1); 
    obj15_z(:,:,i) = obj15_z(:,:,i-1);
    obj16_z(:,:,i) = obj16_z(:,:,i-1); 
    obj17_z(:,:,i) = obj17_z(:,:,i-1);
    obj18_z(:,:,i) = obj18_z(:,:,i-1); 
    obj19_z(:,:,i) = obj19_z(:,:,i-1);
    obj20_z(:,:,i) = obj20_z(:,:,i-1); 
    obj21_z(:,:,i) = obj21_z(:,:,i-1);
    obj22_z(:,:,i) = obj22_z(:,:,i-1); 
    obj23_z(:,:,i) = obj23_z(:,:,i-1);
    obj24_z(:,:,i) = obj24_z(:,:,i-1); 
    obj25_z(:,:,i) = obj25_z(:,:,i-1);
    obj26_z(:,:,i) = obj26_z(:,:,i-1); 
    obj27_z(:,:,i) = obj27_z(:,:,i-1);
    obj28_z(:,:,i) = obj28_z(:,:,i-1); 
    obj29_z(:,:,i) = obj29_z(:,:,i-1);
    obj30_z(:,:,i) = obj30_z(:,:,i-1); 
    obj31_z(:,:,i) = obj31_z(:,:,i-1);
    obj32_z(:,:,i) = obj32_z(:,:,i-1); 
    obj33_z(:,:,i) = obj33_z(:,:,i-1);
    obj34_z(:,:,i) = obj34_z(:,:,i-1);
    obj35_z(:,:,i) = obj35_z(:,:,i-1);
    obj36_z(:,:,i) = obj36_z(:,:,i-1); 
    obj37_z(:,:,i) = obj37_z(:,:,i-1);
    obj38_z(:,:,i) = obj38_z(:,:,i-1); 
    obj39_z(:,:,i) = obj39_z(:,:,i-1);
    obj40_z(:,:,i) = obj40_z(:,:,i-1); 
    obj41_z(:,:,i) = obj41_z(:,:,i-1);
    obj42_z(:,:,i) = obj42_z(:,:,i-1); 
    obj43_z(:,:,i) = obj43_z(:,:,i-1);
    obj44_z(:,:,i) = obj44_z(:,:,i-1); 
    obj45_z(:,:,i) = obj45_z(:,:,i-1);
    obj46_z(:,:,i) = obj46_z(:,:,i-1); 
    obj47_z(:,:,i) = obj47_z(:,:,i-1);
    obj48_z(:,:,i) = obj48_z(:,:,i-1); 
    obj49_z(:,:,i) = obj49_z(:,:,i-1);
    obj50_z(:,:,i) = obj50_z(:,:,i-1); 
    obj51_z(:,:,i) = obj51_z(:,:,i-1);
    obj52_z(:,:,i) = obj52_z(:,:,i-1); 
    obj53_z(:,:,i) = obj53_z(:,:,i-1);
    obj54_z(:,:,i) = obj54_z(:,:,i-1);
    obj55_z(:,:,i) = obj55_z(:,:,i-1);
    obj56_z(:,:,i) = obj56_z(:,:,i-1); 
    obj57_z(:,:,i) = obj57_z(:,:,i-1);
    obj58_z(:,:,i) = obj58_z(:,:,i-1); 
    obj59_z(:,:,i) = obj59_z(:,:,i-1);
    obj60_z(:,:,i) = obj60_z(:,:,i-1); 
    obj61_z(:,:,i) = obj61_z(:,:,i-1);
    obj62_z(:,:,i) = obj62_z(:,:,i-1); 
    
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
    if sqrt(obj8_x(1, 1, i)^2 + obj8_y(1, 1, i)^2) < visibility
        vis_8(i) = 1;
    end
    if sqrt(obj9_x(1, 1, i)^2 + obj9_y(1, 1, i)^2) < visibility
        vis_9(i) = 1;
    end
    if sqrt(obj10_x(1, 1, i)^2 + obj10_y(1, 1, i)^2) < visibility
        vis_10(i) = 1;
    end
    if sqrt(obj11_x(1, 1, i)^2 + obj11_y(1, 1, i)^2) < visibility
        vis_11(i) = 1;
    end
    if sqrt(obj12_x(1, 1, i)^2 + obj12_y(1, 1, i)^2) < visibility
        vis_12(i) = 1;
    end
    if sqrt(obj13_x(1, 1, i)^2 + obj13_y(1, 1, i)^2) < visibility
        vis_13(i) = 1;
    end
    if sqrt(obj14_x(1, 1, i)^2 + obj14_y(1, 1, i)^2) < visibility
        vis_14(i) = 1;
    end
    if sqrt(obj15_x(1, 1, i)^2 + obj15_y(1, 1, i)^2) < visibility
        vis_15(i) = 1;
    end
    if sqrt(obj16_x(1, 1, i)^2 + obj16_y(1, 1, i)^2) < visibility
        vis_16(i) = 1;
    end
    if sqrt(obj17_x(1, 1, i)^2 + obj17_y(1, 1, i)^2) < visibility
        vis_17(i) = 1;
    end
    if sqrt(obj18_x(1, 1, i)^2 + obj18_y(1, 1, i)^2) < visibility
        vis_18(i) = 1;
    end
    if sqrt(obj19_x(1, 1, i)^2 + obj19_y(1, 1, i)^2) < visibility
        vis_19(i) = 1;
    end
    if sqrt(obj20_x(1, 1, i)^2 + obj20_y(1, 1, i)^2) < visibility
        vis_20(i) = 1;
    end
    if sqrt(obj21_x(1, 1, i)^2 + obj21_y(1, 1, i)^2) < visibility
        vis_21(i) = 1;
    end
    if sqrt(obj22_x(1, 1, i)^2 + obj22_y(1, 1, i)^2) < visibility
        vis_22(i) = 1;
    end
    if sqrt(obj23_x(1, 1, i)^2 + obj23_y(1, 1, i)^2) < visibility
        vis_23(i) = 1;
    end
    if sqrt(obj24_x(1, 1, i)^2 + obj24_y(1, 1, i)^2) < visibility
        vis_24(i) = 1;
    end
    if sqrt(obj25_x(1, 1, i)^2 + obj25_y(1, 1, i)^2) < visibility
        vis_25(i) = 1;
    end
    if sqrt(obj26_x(1, 1, i)^2 + obj26_y(1, 1, i)^2) < visibility
        vis_26(i) = 1;
    end
    if sqrt(obj27_x(1, 1, i)^2 + obj27_y(1, 1, i)^2) < visibility
        vis_27(i) = 1;
    end
    if sqrt(obj28_x(1, 1, i)^2 + obj28_y(1, 1, i)^2) < visibility
        vis_28(i) = 1;
    end
    if sqrt(obj29_x(1, 1, i)^2 + obj29_y(1, 1, i)^2) < visibility
        vis_29(i) = 1;
    end
    if sqrt(obj30_x(1, 1, i)^2 + obj30_y(1, 1, i)^2) < visibility
        vis_30(i) = 1;
    end
    if sqrt(obj31_x(1, 1, i)^2 + obj31_y(1, 1, i)^2) < visibility
        vis_31(i) = 1;
    end
    if sqrt(obj32_x(1, 1, i)^2 + obj32_y(1, 1, i)^2) < visibility
        vis_32(i) = 1;
    end
    if sqrt(obj33_x(1, 1, i)^2 + obj33_y(1, 1, i)^2) < visibility
        vis_33(i) = 1;
    end
    if sqrt(obj34_x(1, 1, i)^2 + obj34_y(1, 1, i)^2) < visibility
        vis_34(i) = 1;
    end
    if sqrt(obj35_x(1, 1, i)^2 + obj35_y(1, 1, i)^2) < visibility
        vis_35(i) = 1;
    end
    if sqrt(obj36_x(1, 1, i)^2 + obj36_y(1, 1, i)^2) < visibility
        vis_36(i) = 1;
    end
    if sqrt(obj37_x(1, 1, i)^2 + obj37_y(1, 1, i)^2) < visibility
        vis_37(i) = 1;
    end
    if sqrt(obj38_x(1, 1, i)^2 + obj38_y(1, 1, i)^2) < visibility
        vis_38(i) = 1;
    end
    if sqrt(obj39_x(1, 1, i)^2 + obj39_y(1, 1, i)^2) < visibility
        vis_39(i) = 1;
    end
    if sqrt(obj40_x(1, 1, i)^2 + obj40_y(1, 1, i)^2) < visibility
        vis_40(i) = 1;
    end
    if sqrt(obj41_x(1, 1, i)^2 + obj41_y(1, 1, i)^2) < visibility
        vis_41(i) = 1;
    end
    if sqrt(obj42_x(1, 1, i)^2 + obj42_y(1, 1, i)^2) < visibility
        vis_42(i) = 1;
    end
    if sqrt(obj43_x(1, 1, i)^2 + obj43_y(1, 1, i)^2) < visibility
        vis_43(i) = 1;
    end
    if sqrt(obj44_x(1, 1, i)^2 + obj44_y(1, 1, i)^2) < visibility
        vis_44(i) = 1;
    end
    if sqrt(obj45_x(1, 1, i)^2 + obj45_y(1, 1, i)^2) < visibility
        vis_45(i) = 1;
    end
    if sqrt(obj46_x(1, 1, i)^2 + obj46_y(1, 1, i)^2) < visibility
        vis_46(i) = 1;
    end
    if sqrt(obj47_x(1, 1, i)^2 + obj47_y(1, 1, i)^2) < visibility
        vis_47(i) = 1;
    end
    if sqrt(obj48_x(1, 1, i)^2 + obj48_y(1, 1, i)^2) < visibility
        vis_48(i) = 1;
    end
    if sqrt(obj49_x(1, 1, i)^2 + obj49_y(1, 1, i)^2) < visibility
        vis_49(i) = 1;
    end
    if sqrt(obj50_x(1, 1, i)^2 + obj50_y(1, 1, i)^2) < visibility
        vis_50(i) = 1;
    end
    if sqrt(obj51_x(1, 1, i)^2 + obj51_y(1, 1, i)^2) < visibility
        vis_51(i) = 1;
    end
    if sqrt(obj52_x(1, 1, i)^2 + obj52_y(1, 1, i)^2) < visibility
        vis_52(i) = 1;
    end
    if sqrt(obj53_x(1, 1, i)^2 + obj53_y(1, 1, i)^2) < visibility
        vis_53(i) = 1;
    end
    if sqrt(obj54_x(1, 1, i)^2 + obj54_y(1, 1, i)^2) < visibility
        vis_54(i) = 1;
    end
    if sqrt(obj55_x(1, 1, i)^2 + obj55_y(1, 1, i)^2) < visibility
        vis_55(i) = 1;
    end
    if sqrt(obj56_x(1, 1, i)^2 + obj56_y(1, 1, i)^2) < visibility
        vis_56(i) = 1;
    end
    if sqrt(obj57_x(1, 1, i)^2 + obj57_y(1, 1, i)^2) < visibility
        vis_57(i) = 1;
    end
    if sqrt(obj58_x(1, 1, i)^2 + obj58_y(1, 1, i)^2) < visibility
        vis_58(i) = 1;
    end
    if sqrt(obj59_x(1, 1, i)^2 + obj59_y(1, 1, i)^2) < visibility
        vis_59(i) = 1;
    end
    if sqrt(obj60_x(1, 1, i)^2 + obj60_y(1, 1, i)^2) < visibility
        vis_60(i) = 1;
    end
    if sqrt(obj61_x(1, 1, i)^2 + obj61_y(1, 1, i)^2) < visibility
        vis_61(i) = 1;
    end
    if sqrt(obj62_x(1, 1, i)^2 + obj62_y(1, 1, i)^2) < visibility
        vis_62(i) = 1;
    end
end

% Saving generated data to structure which will be saved to .mat file and
% used in simulation
% Types: 1-car, 2-pedestrian, 3-sign, 4-building

object = struct('type', {1, 1, 1, 4, 2, 4, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4}, ...
    'x', {obj0_x, obj1_x, obj2_x, obj3_x, obj4_x, obj5_x, obj6_x, obj7_x, obj8_x, obj9_x, obj10_x, obj11_x, obj12_x, obj13_x, obj14_x, obj15_x, obj16_x, obj17_x, obj18_x, obj19_x, obj20_x, obj21_x, obj22_x, obj23_x, obj24_x, obj25_x, obj26_x, obj27_x, obj28_x, obj29_x, obj30_x, obj31_x, obj32_x, obj33_x, obj34_x, obj35_x, obj36_x, obj37_x, obj38_x, obj39_x, obj40_x, obj41_x, obj42_x, obj43_x, obj44_x, obj45_x, obj46_x, obj47_x, obj48_x, obj49_x, obj50_x, obj51_x, obj52_x, obj53_x, obj54_x, obj55_x, obj56_x, obj57_x, obj58_x, obj59_x, obj60_x, obj61_x, obj62_x}, ... 
    'y', {obj0_y, obj1_y, obj2_y, obj3_y, obj4_y, obj5_y, obj6_y, obj7_y, obj8_y, obj9_y, obj10_y, obj11_y, obj12_y, obj13_y, obj14_y, obj15_y, obj16_y, obj17_y, obj18_y, obj19_y, obj20_y, obj21_y, obj22_y, obj23_y, obj24_y, obj25_y, obj26_y, obj27_y, obj28_y, obj29_y, obj30_y, obj31_y, obj32_y, obj33_y, obj34_y, obj35_y, obj36_y, obj37_y, obj38_y, obj39_y, obj40_y, obj41_y, obj42_y, obj43_y, obj44_y, obj45_y, obj46_y, obj47_y, obj48_y, obj49_y, obj50_y, obj51_y, obj52_y, obj53_y, obj54_y, obj55_y, obj56_y, obj57_y, obj58_y, obj59_y, obj60_y, obj61_y, obj62_y}, ...
    'z', {obj0_z, obj1_z, obj2_z, obj3_z, obj4_z, obj5_z, obj6_z, obj7_z, obj8_z, obj9_z, obj10_z, obj11_z, obj12_z, obj13_z, obj14_z, obj15_z, obj16_z, obj17_z, obj18_z, obj19_z, obj20_z, obj21_z, obj22_z, obj23_z, obj24_z, obj25_z, obj26_z, obj27_z, obj28_z, obj29_z, obj30_z, obj31_z, obj32_z, obj33_z, obj34_z, obj35_z, obj36_z, obj37_z, obj38_z, obj39_z, obj40_z, obj41_z, obj42_z, obj43_z, obj44_z, obj45_z, obj46_z, obj47_z, obj48_z, obj49_z, obj50_z, obj51_z, obj52_z, obj53_z, obj54_z, obj55_z, obj56_z, obj57_z, obj58_z, obj59_z, obj60_z, obj61_z, obj62_z}, ...
    'speed', {-tr1*1.1, tr1, tr1*1.2, -tr1, tr1/2, -tr1, -tr1*1.1, -tr1*1.1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1, -tr1},...
    'visibility', {vis_0, vis_1, vis_2, vis_3, vis_4, vis_5, vis_6, vis_7, vis_8, vis_9, vis_10, vis_11, vis_12, vis_13, vis_14, vis_15, vis_16, vis_17, vis_18, vis_19, vis_20, vis_21, vis_22, vis_23, vis_24, vis_25, vis_26, vis_27, vis_28, vis_29, vis_30, vis_31, vis_32, vis_33, vis_34, vis_35, vis_36, vis_37, vis_38, vis_39, vis_40, vis_41, vis_42, vis_43, vis_44, vis_45, vis_46, vis_47, vis_48, vis_49, vis_50, vis_51, vis_52, vis_53, vis_54, vis_55, vis_56, vis_57, vis_58, vis_59, vis_60, vis_61, vis_62});

% Saving object to .mat file with time vector
save('dane.mat', 'object', 'time','x','y')
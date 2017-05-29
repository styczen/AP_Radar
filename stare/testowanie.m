clear all; close all;

% t = 0:.01:2*pi;
% x = cos(2*t).*(cos(t).^2);
% y = sin(2*t).*(sin(t).^2);
% comet(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% h = animatedline;
% axis([-100,100,-100,100])
% 
% x = linspace(0,10,100);
% y = x;
% for k = 1:length(x)
%     addpoints(h,x(k),y(k));
%     drawnow
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all;
% clc;
% x=[-3:0.1:3];
% y=[-3:0.1:3];
% t=[0:0.1:5];
% hFigure = figure;
% numberOfFrames = length(t);
% % Set up the movie structure.
% % Preallocate recalledMovie, which will be an array of structures.
% % First get a cell array with all the frames.
% allTheFrames = cell(numberOfFrames,1);
% vidHeight = 344;
% vidWidth = 446;
% allTheFrames(:) = {zeros(vidHeight, vidWidth, 3, 'uint8')};
% % Next get a cell array with all the colormaps.
% allTheColorMaps = cell(numberOfFrames,1);
% allTheColorMaps(:) = {zeros(256, 3)};
% % Now combine these to make the array of structures.
% myMovie = struct('cdata', allTheFrames, 'colormap', allTheColorMaps);
% % Create a VideoWriter object to write the video out to a new, different file.
% % writerObj = VideoWriter('problem_3.avi');
% % open(writerObj);
% % Need to change from the default renderer to zbuffer to get it to work right.
% % openGL doesn't work and Painters is way too slow.
% set(gcf, 'renderer', 'zbuffer');
% 	
% [x, y] = meshgrid(-3:.1:3,-3:.1:3);
% for frameIndex = 1 : numberOfFrames
% 	z = exp(-(x-t(frameIndex)).^2-(y-t(frameIndex)).^2);
% 	cla reset;
% 	% Enlarge figure to full screen.
% % 	set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0, 1, 1]);
% 	surf(x,y,z);
% 	axis('tight')
% 	zlim([0, 1]);
% 	caption = sprintf('Frame #%d of %d, t = %.1f', frameIndex, numberOfFrames, t(frameIndex));
% 	title(caption, 'FontSize', 15);
% 	drawnow;
% 	thisFrame = getframe(gca);
% 	% Write this frame out to a new video file.
% %  	writeVideo(writerObj, thisFrame);
% 	myMovie(frameIndex) = thisFrame;
% end
% % close(writerObj);
% message = sprintf('Done creating movie\nDo you want to play it?');
% button = questdlg(message, 'Continue?', 'Yes', 'No', 'Yes');
% drawnow;	% Refresh screen to get rid of dialog box remnants.
% close(hFigure);
% if strcmpi(button, 'No')
%    return;
% end
% hFigure = figure;
% % Enlarge figure to full screen.
% % set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0, 1, 1]);
% title('Playing the movie we created', 'FontSize', 15);
% % Get rid of extra set of axes that it makes for some reason.
% axis off;
% % Play the movie.
% movie(myMovie);
% uiwait(helpdlg('Done with demo!'));
% close(hFigure);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% x = [0 1 1 0; ...
%      1 1 0 0];
% y = [0 0 1 1; ...
%      0 1 1 0];
% plot(x,y), axis([-5, 5, -5, 5]), hold on,  grid on
time = 500;

auto0_x = [0, -1, -1, 0; ...
     -1, -1, 0, 0];
auto0_y = [10 10 9 9; ...
     10 9 9 10];

auto1_x = [0 1 1 0; ...
     1 1 0 0];
auto1_y = [-10 -10 -9 -9; ...
     -10 -9 -9 -10];
 
auto2_x = [0 1 1 0; ...
     1 1 0 0];
auto2_y = [-5 -5 -4 -4; ...
     -5 -4 -4 -5];

plot(auto1_x, auto1_y, 'k');
x_axis = [-10, 10]; y_axis = [-10, 10]; % axis limits
tr = 0.1; tr1 = 0.05;

for i=1:time
    clf
     
    plot(auto0_x,auto0_y,'k'), axis([x_axis, y_axis]), grid on, hold on
    plot(auto1_x,auto1_y,'k'), plot(auto2_x, auto2_y, 'k')
    line([-1.3 -1.3],y_axis), line([1.3 1.3],y_axis)
    auto0_y=auto0_y-tr1*4; % changes in 1st object
    auto1_y=auto1_y+tr1;
    auto2_y=auto2_y+tr1*2;
   
    
    pause(0.01)
end

% create our data points as column vectors of x and y points
points = [1,3;2,4];
% create A matrix
A = [points(:,1),[1;1]];
% estimate linear coefficents
coefficients = A \ points(:,2);
% Calculate the fitted line based on the estimated coefficients
xFit = linspace(0, 3, 100);
yFit = coefficients(1) * xFit + coefficients(2);

% create figure
f = figure(1);
clf;
f.Units = "centimeters"; % change units for figure sizing to centimeters
f.Position = [4,4,12,10]; % x & y location bottum left corner, then width and height 

% plot the Data points
p = plot(points(:,1), points(:,2), 'o'); % Plot the points with lines connecting them
p.Color = 'r';
p.Color = [1 0 0];
p.MarkerSize = 5; % Set the size of the markers
p.LineWidth = 1;

%plot the straight line
hold on; % Retain current plot when adding new plots
plot(xFit, yFit, 'b-', 'LineWidth', 1); % Plot the fitted line

% make the plot pretty
xlim([0 3])
ylim([1 5])
grid on % turns on background grid (can also call grid minor for finer grid)
% title('Plot of Points'); % create a title
xl = xlabel('X-axis'); % create x label
yl = ylabel('Y-axis'); % create y label
xl.FontSize = 12; % change fontsize of the x label
yl.FontSize = 12; % change fontsize of the y label

% export the figure
exportgraphics(gcf,'bin/problem_1_1.pdf','ContentType','vector')
% exportgraphics(gcf,'bin/problem_1_1.svg','ContentType','vector')
exportgraphics(gcf,'bin/problem_1_1.png')
exportgraphics(gcf,'bin/problem_1_1.jpeg')

% vector graphics scale well as you zoom, were as raster graphics (png and
%  jpeg) are better for more complicated figures. Look at the file sizes 
% and compare quality when zooming in etc...

copygraphics(gcf,"ContentType","vector") % you can also copy the figure 
% directly to the clipboard!


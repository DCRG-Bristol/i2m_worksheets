% create are data points as column vectors of x and y points
points = [1,3;2,4;1.5,4];

% create A matrix for linear Fit
A_lin = [points(:,1),ones(size(points,1),1)];
% estimate linear coefficents
coefficients_lin = A_lin \ points(:,2);

% create A matrix for quadratic Fit
A_quad = [points(:,1).^2,points(:,1),ones(size(points,1),1)];
% estimate quadratic coefficents
coefficients_quad = A_quad \ points(:,2);

% Calculate the fitted lines based on the estimated coefficients
xFit = linspace(0, 3, 20);
yFit_lin = coefficients_lin(1) * xFit + coefficients_lin(2);
yFit_quad = coefficients_quad(1) * xFit.^2 + coefficients_quad(2) * xFit + coefficients_quad(3);

%% create figure
f = figure(1);
clf;
f.Units = "centimeters"; % change units for figure sizing to centimeters
f.Position = [4,4,12,10]; % x & y location bottum left corner, then width and height 

% plot the Data points
p = plot(points(:,1), points(:,2), 'ro'); % Plot the points with lines connecting them
% ------ examples of how to make the plot pretty ----------
p.Color = 'r';
p.Color = [1 0 0];
p.MarkerSize = 5; % Set the size of the markers
p.LineWidth = 1; % set the line width of the marker
% --------------------------------------------------------

%plot the straight line
hold on; % Retain current plot when adding new plots
plot(xFit, yFit_lin, 'b-', 'LineWidth', 1); % Plot the fitted line

%plot the quadratic polynomial
plot(xFit, yFit_quad, 'g-', 'LineWidth', 1); % Plot the fitted line

% make the plot pretty
xlim([0 3])
ylim([1 5])
grid on % turns on background grid (can also call grid minor for finer grid)
% title('Plot of Points'); % create a title
xl = xlabel('X-axis'); % create x label
yl = ylabel('Y-axis'); % create y label
set(gca,"FontSize",12) % change fontsize. or ax=gca;ax.FontSize=12;

% create legend
lg = legend('Data Points','Linear Fit','Quadratic Fit');
lg.FontSize = 12;
lg.Location = "northwest";

%% export the figure
% exportgraphics(gcf,'bin/problem_1_2.pdf','ContentType','vector')
exportgraphics(gcf,'bin/problem_1_2.png')

% vector graphics scale well as you zoom, where as raster graphics (png and
%  jpeg) are better for more complicated figures. Look at the file sizes 
% and compare quality when zooming in on word...

copygraphics(gcf) % you can also copy the figure direct to the clipboard!


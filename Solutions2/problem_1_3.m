% load the data
load("data\passengerdata.mat","xs","ys");

% use polyfit to fit a quadratic polynomial to the data
p = polyfit(xs, ys, 2);

% create a figure and plot the data points and teh curve fit
f = figure(1);
clf;
% set units to centimeters and set a suitable size
set(f, 'Units', 'centimeters', 'Position', [5, 5, 12, 10]);
plot(xs, ys./1e3,'o'); % Plot the data points
hold on;
xFit = linspace(min(xs), max(xs), 100); % Generate x values for the fit
yFit = polyval(p, xFit); % Evaluate the polynomial at the x values
plot(xFit, yFit./1e3, 'r-', 'LineWidth', 1.5); % Plot the polynomial fit
xlabel('Year');
ylabel('Passengers (Thousands)');
% title('Quadratic Fit to Passenger Data');
grid on

% set font size
ax = gca;
ax.FontSize = 12;

% make legend
lg = legend('Data Points', 'Quadratic Fit', 'Location', 'best');
lg.FontSize = 12;

%% export graphic

% exportgraphics(gcf,'bin/problem_1_3.pdf','ContentType','vector')
exportgraphics(gcf,'bin/problem_1_3.png')

% vector graphics scale well as you zoom, where as raster graphics (png and
%  jpeg) are better for more complicated figures. Look at the file sizes 
% and compare quality when zooming in on word...

copygraphics(gcf,"ContentType","vector") % you can also copy the figure direct to the clipboard!



clear all; close all;
%% Task 1: Write a function with the signature [V,M] = GetLoads(x,Loads) 
% to create shear force and bending moment diagrams, where x is a 1xN 
% array of values to evaluate the loads at, Loads is a Nx2 array 
% where the first column denotes the x location of a force, and the second 
% column denotes its magnitude.

function [V,M] = GetLoads(x,forces)
% check x is in bounds
if any(x<0) || any(x>1)
    error("values of x must be between 0 and 1")
end
% pre-allocate arrays
V = zeros(1,numel(x));
M = zeros(1,numel(x));
% iterate over loads and add there cotribution
for i = 1:size(forces,1)
    % get index of points inboard of the Load
    idx = x >= forces(i,1);
    % add to V and M
    V(idx) = V(idx) - forces(i,2);
    M(idx) = M(idx) - (x(idx)-forces(i,1)).*forces(i,2);
end
end

% Test values of V and M for single load
[V,M] = GetLoads(0:0.1:1,[0 1]);
if any(V~=-1) || M(1)~=0 || M(end)~=-1
    error('incorrect calculation with one load')
end

% Test values of V and M for two loads
[V,M] = GetLoads(0:0.1:1,[0 1;0.5 2]);
if V(1)~=-1 || V(end)~=-3 || M(1)~=0 || M(end)~=-2
    error('incorrect calculation with two loads')
end

% Test argument validation of x: a "try-catch" block runs the code after
% try, if an error occurs, it is "caught" and the code after "catch" is
% run. The code in the "catch" block is only run if there is an error.
try
    [V,M] = GetLoads(1.5,[0 1]);
    % the code should have errored so throw an error with a specific
    % identifier so we can filter it in the catch statment
    error('Custom:ArgValidationFailed',"No Error thrown for incorrect x input")
catch err
    % an error has occured! check if it is our custom identifier, if it is 
    % rethrow the rror to notify the user their code is broken. Otherwise
    % continue
    if strcmp(err.identifier,'Custom:ArgValidationFailed')
        rethrow(err)
    end
end


%% Task 2: Plot V and M for the loads Loads = [0 2;0.5 1]

% calc distribution
forces = [0 -2;0.5 -1];
x = 0:0.01:1;
[V,M] = GetLoads(x,forces);

% make the plot
f = figure;
f.Units = "centimeters";
f.Position = [4,4,10,10];
hold on
plot(x,V,'-',DisplayName='Shear Force [N]',LineWidth=1.5)
plot(x,M,'-',DisplayName='Bending Moment [Nm]',LineWidth=1.5)

xlabel('Normailised location along beam');
ylabel('Magnitude');
grid on
set(gca,"FontSize",11);

% make a legend
lg = legend();
lg.FontSize = 11;
lg.Location = "best";

%% Task 3: Create a MATLAB function with the signature 
% `loads = DiscretiseUniformForce(N,m)`, which discretises a uniformly 
% distributed load of `m` Newtons into `N` point loads. The output `loads` 
% should be of a format to be used in the function `GetLoads(x,Loads)`. 

function forces = DiscretiseUniformForce(N,m)
    % the beam has a span of 1 so a uniform load has a magnitude of N.
    
    % split the beam into N Forces
    n = linspace(0,1,N+1); % forces will lie in the centre of a discretised region and will ahve a magnitude of its area
    y = ones(size(n))*m; % the magnitude of the distributed load at each node is 3;
    
    x = (n(2:end)+n(1:end-1))/2; % calc the centre location of each section ( this is where we will apply the load)
    dx = n(2:end)-n(1:end-1); % calc the width of each section
    
    F = (y(2:end)+y(1:end-1))/2 .* dx; % calc magnitude of each point force ( sun of the area of each section

    % create load array
    forces = [x',F'];
end

%% Task 3: Plot V and M for a uniformly distributed load of -3N

% calc V and M
forces = DiscretiseUniformForce(100,-3);
x = 0:0.01:1;
[V,M] = GetLoads(x,forces);

% create plot
f = figure;
f.Units = "centimeters";
f.Position = [4,20,16,10];
tt = tiledlayout(1,2);
% first plot
nexttile(1)
plot(x,V,'-',LineWidth=1.5)
ylabel('Shear Force [N]');

% second plot
nexttile(2)
plot(x,M,'-',LineWidth=1.5)
ylabel('Bending Moment [Nm]');

% make pretty
for i = 1:2
    nexttile(i)
    grid on
    set(gca,"FontSize",11);
end
tt.XLabel.String = 'Normailised location along beam';
tt.Title.String = 'Shear Force and Bending Moment for a Beam Under Uniform Load';
tt.Title.FontSize = 10;


%% Task 4: find the value of `b` such that $$\int^1_0{F}dx = 3$$

% The Area of an ellipse is pi*a*b, in this case a=1 so A=pi*b;
% the load distrubition is a quarter of an ellipse, so m = pi*b/4, therefore
% b = 4*m/pi;

%% Task 5: Create a MATLAB function with the signature 
% loads = getEllipticalLoads(m) 
% which discretise a 3N elliptical load into a series of m point loads and 
% returns them as an array which can be used in the function 
% [V,M] = GetLoads(x,Loads).

function forces = DiscretiseEllipticalForce(N,m)
    % split the beam into m Forces

    % forces will lie in the centre of a discretised region and will have a magnitude of its area
    n = linspace(0,1,N+1); 
    
    b = 4*abs(m)/pi;
    y = sqrt((1-(n-1).^2)).*b*sign(m); % the magnitude of the distributed load at each node;
    
    x = (n(2:end)+n(1:end-1))/2; % calc the centre location of each section ( this is where we will apply the load)
    dx = n(2:end)-n(1:end-1); % calc the width of each section
    
    F = (y(2:end)+y(1:end-1))/2 .* dx; % calc magnitude of each point force ( sum of the area of each section assuming a trapezoid)
    
    % create load array
    forces = [x',F'];
end

%% Task 6: Plot V and M for both a 3N elliptical load distribution and

% calc V and M
x = 0:0.01:1;
N = 100;
m = 3;
f_uniform = DiscretiseUniformForce(N,m);
f_elliptical = DiscretiseEllipticalForce(N,m);

[V_uniform,M_uniform] = GetLoads(x,f_uniform);
[V_ellip,M_ellip] = GetLoads(x,f_elliptical);

% create plot
f = figure;
f.Units = "centimeters";
f.Position = [16,4,16,10];
tt = tiledlayout(1,2);
% first plot
nexttile(1)
hold on
plot(x,V_uniform,'-',LineWidth=1.5)
plot(x,V_ellip,'-',LineWidth=1.5)
ylabel('Shear Force [N]');

% second plot
nexttile(2)
hold on
plot(x,M_uniform,'-',LineWidth=1.5)
plot(x,M_ellip,'-',LineWidth=1.5)
ylabel('Bending Moment [Nm]');

lg = legend('Uniform','Elliptical');
lg.Title.String = 'Distribution';
lg.Layout.Tile = 'east';

% make pretty
for i = 1:2
    nexttile(i)
    grid on
    set(gca,"FontSize",11);
end
tt.XLabel.String = 'Normailised location along beam';
tt.Title.String = 'Shear Force and Bending Moment for a Beam Under differnt Loadings';
tt.Title.FontSize = 10;




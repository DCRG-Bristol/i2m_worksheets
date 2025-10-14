clear all
close all
%% Task 1: Write a MATLAB function with the signature 
% `[u] = flowVelocity(p)` which returns the flow velocity u (a 2xN vector, 
% where row one is the u velocity component and row 2 is the v component), 
% at the points p (a 2xN vector, where row one is the $$x$$ coordinate 
% and row 2 is the $$y$$ coordinate). 
% Use the same equation as that in section 3.

function [u]=flowVelocity(p)
    u=[1+(p(1,:)./(2*pi*(p(1,:).^2+p(2,:).^2)));...
      p(2,:)./(2*pi*(p(1,:).^2+p(2,:).^2))];
end

% test function
[u]=flowVelocity([0.5;1]);
if abs(norm(u) - 1.0713)>1e-3
    error('Error in flow velocity')
end

%% Task 2: Write a MATLAB function with the signature 
% `[p,t] = getStreamline(p0,dt)` which returns the path of a streamline 
% starting the point `p0` (a 2x1 vector). Use the Euler method described 
% above, where the argument `dt` is the timestep to use. Stop the 
% integration if the streamlines leaves the bounding box or if the 
% maximum number of timesteps exceed 2000.

function [p,t] = getStreamline(p0,dt)
Nmax = 1000; % max iterations
% pre-allocate arrays
p = zeros(2,Nmax);
t = (0:(Nmax)-1).*dt;

% set intial position
p(:,1) = p0;

% iterate until streamline is out of the box
i=1;
while max(abs(p(:,i)))<=1 && i<Nmax
    %calc velcity vector at old position
    u = flowVelocity(p(:,i));
    % calc new position
    p(:,i+1) = p(:,i) + u.*dt;
    % iterate i
    i = i+1;
end
% we have left the box so stop simulation and trim arrays
p = p(:,1:i);
t = t(1:i);
end

% test function
[p,t] = getStreamline([-1;0.5],1e-2);
if abs(p(1,end)-1.004)>1e-2  || abs(p(2,end)-0.8178)>1e-2
    error('Error in stream line calculation')
end

%% Task 3: Starting at the point (-1,0.5), plot the streamlines for each of
% the following timesteps `dts = [2,1,0.5,0.1,0.01]`. Comment on the 
% difference, and choose a suitable timestep to use moving forwards



% Plot
f = figure;
f.Units = "centimeters";
f.Position = [4,4,10,10];
hold on

dts = [2,1,0.5,1e-1,1e-2]; % define array of step times
% iterate over each step time and plot the streamline
for i = 1:length(dts)
    [p,t] = getStreamline([-1;0.5],dts(i));
    plot(p(1,:),p(2,:),'.-','DisplayName',num2str(dts(i)));
end

% make the figure pretty
xlabel('x')
ylabel('y')
set(gca,'FontSize',12)
xlim([-1 1])
grid on

% make a legend
lg = legend();
lg.FontSize = 12;
lg.Title.String = 'Step Size [s]';
lg.Location = "northwest";
lg.NumColumns = 2;



%% Task 4: Plot the streamline starting at (-1,0).

% this streamline approaches a stagnation point so never exits the bounding
% box. either implement a maximum number of time steps, or a stopping
% criteria on the minimum velocity magnitude.

f = figure;
f.Units = "centimeters";
f.Position = [4,4,10,10];

%plot the streamline
[p,t] = getStreamline([-1;0],1e-2);
plot(p(1,:),p(2,:),'.-');

% make the figure pretty
xlabel('x')
ylabel('y')
set(gca,'FontSize',12)
grid on
xlim([-1 1])


% make a legend
lg = legend();
lg.FontSize = 12;
lg.Title.String = 'Step Size [s]';
lg.Location = "northwest";
lg.NumColumns = 2;



%% Task 5: Load the figure you created in section 3 
% (e.g. the `.fig` file you saved - Hint `help openfig`). Plot the 
% streamlines starting at `x = -1`, `y = -1:0.25:1` onto this figure.

f = openfig(fullfile('bin','potFlow.fig'),"new");

ys = -1:0.1:1;
for i = 1:length(ys)
    [p,t] = getStreamline([-1;ys(i)],1e-2);
    plot(p(1,:),p(2,:),'r-','LineWidth',1);
end

% make pretty
xlabel('x')
ylabel('y')
set(gca,'FontSize',12)

f.Position = [4,4,14,10];
lg = legend('Contour Plot', 'Quiver Plot', 'Streamlines');
lg.FontSize = 10;
lg.Location = "eastoutside";
lg.NumColumns = 1;
grid on
xlim([-1 1])
ylim([-1 1])
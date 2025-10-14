clear all; close all;

%% Task 1: Write a code to simulate how temperature in the rod varies with time


function [u,t] = SimulateRod(N,u0,ub1,ub2,opts)
arguments
    N   % number of nodes 
    u0  % Initial condition of rod
    ub1 % boundary condition 1
    ub2 % boundary condition 2
    opts.tMax = 1 % maximum time
    opts.threshold = 1e-2 % threshold to stop simulation at
end

% define dt
dx = 1/N;
dt = 0.5*dx^2;

% pre-allocate arrays
tMax = ceil(opts.tMax/dt)*dt; % ensure max time is a multiple of dt;
t = 0:dt:tMax; % make array of times
u = zeros(N,length(t)); % array to store temperatures in

% set inital condition
u(:,1) = u0(:);

% set boundary conditions
if isa(ub1,"function_handle")  
    u(1,:) = ub1(t);
else
    u(1,:) = ub1;
end

if isa(ub2,"function_handle")
    u(end,:) = ub2(t);
else
    u(end,:) = ub2;
end

% iterate time
idx = 2:(N-1); % helpful for selecting slices of the nodes that change
for i = 1:length(t)-1 
    du = 0.5.*(u(idx+1,i) - 2*u(idx,i) + u(idx-1,i)); % change in temperature at each node
    u(idx,i+1) = u(idx,i) + du; % store new temperature in the array
    if max(abs(du))/dt<opts.threshold
        % stop the simulation as the rod has reach equilibirum
        break
    end
end

% trim arrays to what was simulated
t = t(1:i+1);
u = u(:,1:i+1);
end

%% Task 2: Using your code, simulate a system in which the rod is 
% initially at a uniform temperature of 2 units. But the ends of the rod 
% are held at a constant lower temperature of 1 unit.

N = 31;
u0 = ones(1,N)*2;
ub1 = 1;
ub2 = 1;

[u,t] = SimulateRod(N, u0, ub1, ub2, threshold=1e-2);

% find time taken to settle
min_u = max(u);
idx = find(min_u<1.01,1);
fprintf('Time Taken to get within 0.01 units: %0.2f seconds\n',t(idx))

f = makeRodPlot(u,t,N);

% make ploting a function so I can re-use it later
function f = makeRodPlot(u,t,N)
    f = figure;
    f.Units = "centimeters";
    f.Position = [4,20,16,9];
    tt = tiledlayout(1,2);
    
    nexttile(1);
    hold on
    % plot surface
    contourf(t,linspace(0,1,N),u)
    xlabel('time [s]')
    ylabel('Beam Position')
    set(gca,"FontSize",10)
    % plot a dashed line to show slice for other plot
    ii = round(N/2);
    xs = linspace(0,1,N);
    plot(t,ones(1,numel(t)).*xs(ii),'k--');
    % make a colorbar
    cb = colorbar();
    cb.Label.String = 'Temperature';
    % change the colour map
    colormap hot
    
    nexttile(2);
    grid on
    plot(t,u(ii,:),'-');
    xlabel('time [s]')
    ylabel('Temperature')
    title(sprintf('Temperature at Pos %.2f',xs(ii)))
    set(gca,"FontSize",10)
    ylim([min(u,[],"all"),max(u,[],"all")])
    grid on
end

%% Task 3.1: Linear initial temperature, then bringing the cool end 
% to a high fixed temperature

N = 31;
u0 = linspace(0,1,N);
ub1 = 1;
ub2 = 1;

[u,t] = SimulateRod(N, u0, ub1, ub2, threshold=1e-1);
f = makeRodPlot(u,t,N);

%% Task 3.2: Constant initial temperature, then having one end hot and 
% the other cool

N = 31;
u0 = linspace(0,0,N);
ub1 = -1;
ub2 = 1;

[u,t] = SimulateRod(N, u0, ub1, ub2, threshold=1e-1);
f = makeRodPlot(u,t,N);

%% Task 3.3: Constant initial temperature of zero, one boundary is 
% constant at zero, the other varies according to the function 
% sin(2*pi*f*t) ...

N = 51;
u0 = linspace(0,0,N);
ub1 = 0;

f = 2; % Hertz
ub2 = @(t) sin(2*pi*f*t); % a function handle of the boundary conidtion, so a call of `ub2(0.1)` will print the boundary contion at time 0.1 etc... 

[u,t] = SimulateRod(N, u0, ub1, ub2, threshold=-1);
f = makeRodPlot(u,t,N);

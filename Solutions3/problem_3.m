clear all
close all
%% Task 1: Write a MATLAB function with the signature 
% [u,v] = flowVelocity(x,y) which returns the flow velocity
% at the point (x,y)

function [u,v]=flowVelocity(x,y)
    u=1+(x./(2*pi*(x.^2+y.^2)));
    v=y./(2*pi*(x.^2+y.^2));
end

% test the function 
[u,v]=flowVelocity(0.5,1);
if abs(sqrt(u.^2 + v.^2) - 1.0713)>1e-3
    error('Error in flow velocity')
end
%% Task 2: Edit the function to ensure it accepts an array as an input

x = -1:0.1:1;
y = -1:0.1:1;
[u,v] = flowVelocity(x,y);

if numel(u)~=numel(x) || numel(v)~=numel(y)
    error('Error in flow velocity')
end

%% Task 3: Create a single plot including both a contour plot and a 
% quiver plot

%Grid for plot
N=20;
x=linspace(-1,1,N);
y=linspace(-1,1,N);
[X,Y]=meshgrid(x,y);

%Calculate flow on grid
[u,v]=flowVelocity(X,Y);

%Magnitude of velocity
mag=zeros(size(X));
for j=1:N
    for i=1:N
        mag(i,j)=norm([u(i,j) v(i,j)]);
    end
end

% Plot
f = figure;
f.Units = "centimeters";
f.Position = [4,4,10,10];

contour(X,Y,mag,50);
hold on
quiver(X,Y,u,v)
xlabel('x')
ylabel('y')
set(gca,'FontSize',12)

%% Task 4: Save the figure in the `.fig` format so we can edit it later. 
% Save the file at `bin\potFlow.fig`

savefig(gcf,fullfile('bin','potFlow.fig'))
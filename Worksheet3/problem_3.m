clear all
close all
%% Task 1: Write a MATLAB function with the signature 
% [u,v] = flowVelocity(x,y) which returns the flow velocity
% at the point (x,y)



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






%% Task 4: Save the figure in the `.fig` format so we can edit it later. 
% Save the file at `bin\potFlow.fig`




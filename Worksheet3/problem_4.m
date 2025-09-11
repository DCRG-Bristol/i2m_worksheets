clear all
close all
%% Task 1: Write a MATLAB function with the signature 
% `[u] = flowVelocity(p)` which returns the flow velocity u (a 2xN vector, 
% where row one is the u velocity component and row 2 is the v component), 
% at the points p (a 2xN vector, where row one is the $$x$$ coordinate 
% and row 2 is the $$y$$ coordinate). 
% Use the same equation as that in section 3.

function [u]=flowVelocity(p)

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


end

% test function
[p,t] = getStreamline([-1;0.5],1e-2);
if abs(p(1,end)-1.004)>1e-2  || abs(p(2,end)-0.8178)>1e-2
    error('Error in stream line calculation')
end

%% Task 3: Starting at the point (-1,0.5), plot the streamlines for each of
% the following timesteps `dts = [2,1,0.5,0.1,0.01]`. Comment on the 
% difference, and choose a suitable timestep to use moving forwards






%% Task 4: Plot the streamline starting at (-1,0).






%% Task 5: Load the figure you created in section 3 
% (e.g. the `.fig` file you saved - Hint `help openfig`). Plot the 
% streamlines starting at `x = -1`, `y = -1:0.25:1` onto this figure.



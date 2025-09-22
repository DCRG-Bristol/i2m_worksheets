clear all; close all;
%% Task 1

function [V,M] = GetLoads(x,forces)



% ------------------------ TODO ------------------------------



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
    % the code should have errored because x is greater than 1 so throw an error with a specific
    % identifier so we can filter it in the catch statment
    error('Custom:ArgValidationFailed',"No Error thrown for incorrect x input")
catch err
    % an error has occured! check if it is our custom identifier, if it is 
    % rethrow the error to notify the user their code is broken. Otherwise
    % continue
    if strcmp(err.identifier,'Custom:ArgValidationFailed')
        rethrow(err)
    end
end


%% Task 2

% calc distribution
forces = [0 -2;0.5 -1];
x = 0:0.01:1;
[V,M] = GetLoads(x,forces);

% make the plot


%% Task 3

function forces = DiscretiseUniformForce(N,m)


end

%% Task 3

% calc V and M
forces = DiscretiseUniformForce(100,-3);
x = 0:0.01:1;
[V,M] = GetLoads(x,forces);

% create plot


%% Task 4






%% Task 5






%% Task 6







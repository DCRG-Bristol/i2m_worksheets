clear all
close all
%% Task 1

%% TODO: Create a function here called `flowVelocity`

% test the function 
[u,v]=flowVelocity(0.5,1);
if abs(sqrt(u.^2 + v.^2) - 1.0713)>1e-3
    error('Error in flow velocity')
end
%% Task 2:

x = -1:0.1:1;
y = -1:0.1:1;
[u,v] = flowVelocity(x,y);

if numel(u)~=numel(x) || numel(v)~=numel(y)
    error('Error in flow velocity')
end

%% Task 3





%% Task 4




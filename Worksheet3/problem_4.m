clear all
close all
%% Task 1:

function [u]=flowVelocity(p)

end

% test function
[u]=flowVelocity([0.5;1]);
if abs(norm(u) - 1.0713)>1e-3
    error('Error in flow velocity')
end

%% Task 2:

function [p,t] = getStreamline(p0,dt)


end

% test function
[p,t] = getStreamline([-1;0.5],1e-2);
if abs(p(1,end)-1.004)>1e-2  || abs(p(2,end)-0.8178)>1e-2
    error('Error in stream line calculation')
end

%% Task 3:






%% Task 4:






%% Task 5:



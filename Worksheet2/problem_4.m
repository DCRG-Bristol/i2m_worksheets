%% Task 1: Write a MATALB function with the signature 
% `[A,err] = estimateArea(N)` 
% to calculate the total area of all the elements attributed to the circle 
% and the error against the theoretical analytical solution, for a `N` 
% squares per axis.

function [A,err] = estimateArea(N)

%% --------------------- TODO ------------------------

end
estimateArea(1000);

%% Task 2: Calculate the required `N` to have a maximum error of 0.001%

% pre-allocate arrays ( faster than changing the size of an array on every
% iteration
Ns = 1:1000;
val = zeros(size(Ns));












%% Task 3: Plot a log-scale graph of the error against the number elements up to an `N` of 1000




clear all; close all; clc;
%% Task 1: Calculate the solution of the follow integral by hand




%% Task 2: Write a MATLAB function with the signature `val = calcMyInt(N)` 
% in the file `calcMyInt.m` that takes an input of $$N$$ and evaluates 
% the above integral using the trapezium method. Where $$N$$ is the number 
% of trapeziums to split the integral up into. Cap $$N$$ to a value of 1000

function val = calcMyInt(N)
% CALCMYINT uses trapezium rule to calc the integral of 2+0.05x^2 + sin(x)
% between 0 and 10
% Author: 
% Date: 

% -------------------------- TODO ----------------------------


end

% test the function
calcMyInt(1e3)

%% Task 3: Use this function to plot how the value of the numerical 
% integral varies as N is changed between 1 and 1000




%% Task 4: Determine the value of N required to evaluate the integral 
% numerically to within 0.001% of the true value.



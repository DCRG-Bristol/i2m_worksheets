clear all; close all; clc;
%% Task 1:
% the indefinite integral is equal to 2*x - cos(x) + x^3/60
% so the definite integral between 0 and 10 is equal to: 113/3 - cos(10) ~= 38.5057 

%% Task 2: Write a MATLAB function with the signature `val = calcMyInt(N)` 
% in the file `calcMyInt.m` that takes an input of $$N$$ and evaluates 
% the above integral using the trapezium method. Where $$N$$ is the number 
% of trapeziums to split the integral up into. Cap $$N$$ to a value of 1000

function val = calcMyInt(N)
% CALCMYINT uses trapezium rule to calc the integral of 2+0.05x^2 + sin(x)
% between 0 and 10
% Author: Fintan Healy
% Date: 09/09/2025

% cap N to 1000
if N>1000
    warning('Capping N to a mximum value of 1000')
    N=1000;
end

% get line spacing of x
x = linspace(0,10,N);

% evalualate equation at each point
y = 2 + 0.05.*x.^2 + sin(x);

% OPTION 1 interate over all trapeziums
% val = 0;
% dx = x(2)-x(1);
% for i = 1:length(x)-1
%     val = val + (y(i+1)+y(i))/2*dx;
% end

% OPTION 2: vectorised to be faster
dx = x(2)-x(1);
val = sum((y(1:end-1)+y(2:end)))/2*dx;

%OPTION 3: use inbuilt method
% val = trapz(x,y);
end

% test the function
calcMyInt(1e3)

%% Task 3: Use this function to plot how the value of the numerical 
% integral varies as N is changed between 1 and 1000

f = figure;
f.Units = "centimeters";
f.Position = [4,4,10,10];
% create Ns to test
Ns = 2:100;

% evalute the integral for each N
vals = zeros(size(Ns));
for i = 1:length(Ns)
    vals(i) = calcMyInt(Ns(i));
end

% plot the results
plot(Ns,vals,'s-')
xlabel('N')
ylabel('Function Value')
set(gca,"FontSize",12)
grid on

%% Task 4: Determine the value of N required to evaluate the integral 
% numerically to within 0.001% of the true value.

Ns = 2:1000;
% evalute the integral for each N
vals = zeros(size(Ns));
for i = 1:length(Ns)
    vals(i) = calcMyInt(Ns(i));
end

true_val = 38.5057;
err = abs(vals - true_val)/true_val*100;
index = find(err>0.001,1,'last'); % we use the 'last' argument to ensure the value has settled
disp(Ns(index+1))
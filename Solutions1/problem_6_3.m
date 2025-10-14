%% Task 3: create a script to ask the user to input an initial number 
% X between 1-100, divide this number by 2 and repeat until the number 
% is below 1, store how many times you have to divide by 2.

clear; clc;
X = input('please enter a number between 1 and 100: ');
% check the number is within the proper interval
assert(X>=1 && X<=100, 'error, the number entered is not within the [1,100]interval');
r = X;
n = 0;
while r>1 % as long as r is above 1 we enter the while loop
r = r/2; % update r
n = n + 1; % increment n to keep track of how many times we divided by 2
end
fprintf('The number was divided %i times. \n',n);



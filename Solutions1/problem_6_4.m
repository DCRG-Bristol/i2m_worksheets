% Task 4: Create a random array of size (10x1) made of numbers between 
% [40 and 70] and find how many times each individual element must be 
% divided by 2 before the results is below 1. Hint: Use a while loop nested
% within a for loop

clear; clc;
x = randi([-40 80],10,1);
n_array = zeros(10,1); % pre-allocate to store the number of times each number is divided
for i=1:numel(x)
    r = x(i);
    n = 0;
    while r>1 % as long as r is above 1 we enter the while loop
        r = r/2; % update r
        n = n + 1; % increment n to keep track of how many times we divided by 2
    end
    n_array(i) = n;
end
disp(n_array);
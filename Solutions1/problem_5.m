%% Task 1: use a for loop to display each element of `A` one at a time, 
% at the same time evaluate the sum of `A`, store the result in `S`.

clear; clc; % clear the workspace, and remove all text from the cmd window

A = [6 8 4 2 -5 0 0 1 -4];
n = numel(A); % number of element in A (i.e. 9)
S = 0; % initialise the sum of A, S to 0
for i=1:n % in this loop "i" will successively take the value 1,2,...,9
    disp(A(i));
    S = S + A(i); % sum up the elements of A into S
end

%% Task 2: using a for loop, check if each element of `A` is greater than 
% its next element, store the indices in an array variable named `id`.

A = [6 8 4 2 -5 0 0 1 -4];
n = numel(A); % number of element in A (i.e. 9)
id = [ ]; % initialise id to be an empty array
for i=1:n-1 % only loops up to n-1 (8), else at i=9, A(i+1) would fail
    if A(i)>A(i+1) % check if A(i) is greater than the next element of the array A(i+1)
        id = [id, i]; % if true, then store the index i of that element
    end
end

%% Task 3: use a for loop to identify the element of `A` greater than 3, 
% and decrease their value by 1, store the result in `B`.

A = [6 8 4 2 -5 0 0 1 -4];
B = A; % copy A into B to start
n = numel(A); % number of element in A (i.e. 9)
for i=1:n
    if B(i)>3 % check if B(i) is greater than 3
        B(i) = B(i)-1; % if true, subtract 1 from the element
    end
end

%% Task 4: use a for loop to remove the element of `A` that are negative, 
% store the results in `A2`.

A = [6 8 4 2 -5 0 0 1 -4];
A2 = A; % copy A into B to start
n = numel(A); % number of element in A (i.e. 9)
id = [ ]; % initialise id to be an empty array
for i=1:n
    if A(i)<0 % check if A(i) is negative
        id = [id, i]; % if true, store the index of the element
    end
end
A2(id) = []; % remove the negative elements from A2

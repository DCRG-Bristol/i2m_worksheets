%% Task 2: Copy the code snippet below, then find and correct the error.

clear;clc;
i=0;
while i<10
  fprintf('Counting from 1 to 10, currently at %i \n',i);
  i = i + 1; %%%%%% The variable was not incremented
end


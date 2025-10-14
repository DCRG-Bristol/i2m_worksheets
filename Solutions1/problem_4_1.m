% create a script which generates a random number between 0 and 10 using 
% `randi`, and checks if the number is above 6. 
% The script should display (`disp`) ”I knew It” if it is 
% or "Maybe next time" if its not. 

clear; clc;                 % clear the workspace, and remove all text from the cmd window
x = randi([0,10]);          % generated a random integer between 0 and 10
if x>6                      % check the condition x greater than 6
    disp('I knew It');      % if the condition is true execute this line
else
    disp('Maybe next time') % if the condition is false execute this line
end

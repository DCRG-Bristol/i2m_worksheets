%% Task 1: create a script to ask the user to input a string, and check if 
% the string is ”linear” or ”quadratic”, else print a warning and ask 
% the user again (infinitely).

clear; clc;
inString = input('Please input a string:','s'); % ask the user to input a string
StoppingCondition = strcmp(inString,'linear') | strcmp(inString,'quadratic') % Boolean
while ~StoppingCondition
inString = input('Please input a string:','s'); % ask the user to input a string
StoppingCondition = strcmp(inString,'linear') | strcmp(inString,'quadratic'); % here we
need to update the condition otherwise we would loop forever!
end


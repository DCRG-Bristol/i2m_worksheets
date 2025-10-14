% create a script which asks the user to input a string (`input`), 
% if the string is ”linear” or ”quadratic” display 
% "thanks for selecting <user input>" 
% where <user input is the string the user wrote>
% if the string is not ”linear” or ”quadratic” display 
% 'Invalid string input detected.'as an error.

clear; clc;
inString = input('Please input a string:','s');                 % ask the user to input a string
if strcmp(inString,'linear') || strcmp(inString,'quadratic')
    fprintf('thanks for selecting %s\n',inString)
else
    error('Invalid string input detected.');
end


clear all
close all
%% Task 1: Create a function with the signature 
% `[x,cp] = readCpData(filename);` 
% which reads the data from the data file.

function [x,cp]=readCpData(filename)


end

%% Task 2: produce a single graph of $$-C_P$$ against $$x/c$$ with all 
% three angles of attack plotted (use different line styles and a 
% legend to distinguish the data sets).

%Read files
[x_00,cp_00]=readCpData('data/naca23015_00degs.txt'); % etc....

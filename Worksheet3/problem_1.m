%% Task 1: Write a function with the signature [alphas,Cls] = readData() 
% to extract data from the data file
clear all
close all
function [alphas,Cls] = readData()



end

% test the function
[alphas,Cls] = readData();
if alphas(1)==-6 && alphas(end)==16 && Cls(1)==-0.34 && Cls(end)== 1.43
    disp('Extracted data correct')
else
    error('Extracted data incorrect')
end

%% Task 2: Write a function with the signature [Cls] = interpCl(alpha) 
% to perform piecewise linear interpolation to find the interpolated lift 
% coefficient for the user-specified angle alpha

function [cl] = getCl(alpha)



end

% test the function
cl = getCl(5);
if cl==0.65
    disp('Single interp correct')
else
    error('Error with single interp')
end

%% Task 3: Ensure the function you generated in step two works for an 
% array input e.g. alphas = 0:0.1:1;



%% Task 4: Extend your script to create a plot showing both the data 
% points, and the `curve’ produced from the linear interpolation 
% (you will need to perform linear interpolation for a large number 
% of angles and plot the resulting response).





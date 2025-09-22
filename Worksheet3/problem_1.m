%% Task 1

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

%% Task 2

function [cl] = getCl(alpha)



end

% test the function
cl = getCl(5);
if cl==0.65
    disp('Single interp correct')
else
    error('Error with single interp')
end

%% Task 3



%% Task 4





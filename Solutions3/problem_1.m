%% Task 1: Write a function with the signature [alphas,Cls] = readData() 
% to extract data from the data file
clear all
close all
function [alphas,Cls] = readData()
    % read data
    fid = fopen('data\liftcoeff.txt');
    C = textscan(fid,'%f %f','HeaderLines',1); % Read data skipping header
    fclose(fid);                                % Don't forget to close file
    
    % reformat data
    alphas = C{1};
    Cls = C{2};
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
    % load data (only do it once)
    persistent alphas
    persistent Cls
    if isempty(alphas)
        [alphas,Cls] = readData();
    end
    % perform interpolation
    cl = interp1(alphas,Cls,alpha);
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

% test the function
alphas = 0:0.1:1;
cl = getCl(alphas);
if numel(cl)==numel(alphas) && abs(cl(3)-0.218)<1e-3
    disp('array interp correct')
else
    error('Error with array interp')
end
%% Task 4: Extend your script to create a plot showing both the data 
% points, and the `curve’ produced from the linear interpolation 
% (you will need to perform linear interpolation for a large number 
% of angles and plot the resulting response).

% create figure
f = figure;
f.Units = "centimeters";
f.Position = [4 4 10 10];

% plot data points
[alphas,Cls] = readData();
p = plot(alphas,Cls,'rs');
hold on

% plot interpolation
as = linspace(min(alphas),max(alphas),100);
cls_interp = getCl(as);
plot(as,cls_interp)
grid minor


% make the figure pretty
ax = gca;
ax.FontSize = 12; % set the FontSize

% set label axis
xlabel('$\alpha$ [deg]')
ylabel('$C_L$')

% save the figure
exportgraphics(gcf,"bin/cl_curve.png")



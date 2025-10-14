%% The Task: Write a MATLAB script to estimate the value of pi:
%1. Ensure the script stops when the estimate reaches a suitable degree of 
% accuracy (the error between the estimate and real value is within 
% a desired tolerance, perhaps 0.1%) HINT: use a while loop
% 2. Plot a log-scale graph of the error against the number of darts thrown

clear all
close all
rng('shuffle'); % is the 'seed' for the random number generator, to ensure we always get the same 'random' numbers

Nmax=1e6;
errPercent=100000.0;
tolPercent=0.00001;

%Initialise counters and vectors for plotting
Nsquare=0;
Ncircle=0;
NPlot=1:Nmax;
errPlot=zeros(Nmax,1);

%Throw darts until error less than tolerance%
while(errPercent > tolPercent)
    
    %Throw dart (scale random number to between -1 to 1 to always in square)
    Nsquare=Nsquare+1;
    x=-1+2*rand(1,1);
    y=-1+2*rand(1,1);
    
    %Does dart land in circle (if distance from origin to location is less
    %than radius, dart is in)?
    if(norm([x y])<1)
        Ncircle=Ncircle+1;
    end
    
    %Current estimate of pi
    piEst=4*Ncircle/Nsquare;
    
    %Error percentage
    errPercent=100*abs(piEst-pi)/pi;
    errPlot(Nsquare)=errPercent;
    
end

f = figure;
f.Units = "centimeters";
f.Position = [4,4,12,10];
loglog(NPlot(1:Nsquare),errPlot(1:Nsquare));
hold on;
xlabel('Darts thrown');
ylabel('pi error [\%]');
grid on
set(gca,"FontSize",11);

% alternate method
f = figure;
f.Units = "centimeters";
f.Position = [4,4,12,10];
plot(NPlot(1:Nsquare),errPlot(1:Nsquare));
hold on;
xlabel('Darts thrown');
ylabel('pi error [\%]');
grid on
ax = gca;
ax.XAxis.Scale = "log";
ax.YAxis.Scale = "log";
set(gca,"FontSize",11);

    
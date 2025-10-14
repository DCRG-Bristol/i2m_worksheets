%% Task 1: Write a MATALB function with the signature 
% `[A,err] = estimateArea(N)` 
% to calculate the total area of all the elements attributed to the circle 
% and the error against the theoretical analytical solution, for a `N` 
% squares per axis.

function [A,err] = estimateArea(N)
% calculate the nodes on the x axis
nodes = linspace(-0.5,0.5,N+1);
% calculate the centre of each square on the x axis
xs = (nodes(2:end) + nodes(1:end-1) )/2;
% the values will be the same in ys
ys = xs;
% create variables for R^2 and area of one square
R = 0.25;
Rsquared = R^2;
Ai = (nodes(2)-nodes(1))^2;

% OPTION 1: For Loop
% % estimate number of squares in the circle
% val = 0;
% for i = 1:length(xs)
%     for j = 1:length(ys)
%         % calc if box in circle
%         if xs(i)^2 + ys(j)^2<=Rsquared
%             val = val + Ai;
%         end
%     end
% end

% OPTION 2: Vectorised
% estimate number of squares in the circle
[X,Y] = meshgrid(xs,ys);
Rs = sqrt(X.^2 + Y.^2);
val = nnz(Rs<=R) * Ai;

%% estimate error
A_true = pi*R^2;
A = val;
err = abs(A-A_true)./A_true;
A = val;
end
estimateArea(1000);

%% Task 2: Calculate the required `N` to have a maximum error of 0.001%

% pre-allocate arrays
Ns = 1:1000;
val = zeros(size(Ns));

% iterate through with a while loop untill condition achieved
i = 0;
err = inf;
while abs(err)>0.00001
    i = i+1;
    if(i>length(Ns))
        error('Reached end of array')
    end
    [~,err] = estimateArea(Ns(i));
    val(i) = err;
end
disp(Ns(i))

%% Task 3: Plot a log-scale graph of the error against the number elements up to an `N` of 1000

% pre-allocate arrays
Ns = 1:1000;
val = zeros(size(Ns));

% calc error values
for i = 1:length(Ns)
    [~,val(i)] = estimateArea(Ns(i));
end

% make the plot
f = figure;
f.Units = "centimeters";
f.Position = [4,4,12,10];
loglog(NPlot(1:Nsquare),errPlot(1:Nsquare));
hold on;
xlabel('Darts thrown');
ylabel('error [\%]');
grid on
set(gca,"FontSize",11);
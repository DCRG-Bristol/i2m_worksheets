%% Task 1: calculate the sin of 0.1𝜋, store in x
sin(0.1*pi);
%% Task 2: calculate the sin of the 45 degree angle
sin(45*pi/180) % or sind(45)
%% Task 3: evaluate 30 evenly spaced points between 0 and 2𝜋, store in x
x = linspace(0,2*pi,30);
%% Task 4: use a for loop to evaluate the sin of 30 values evenly spaced between 
% 0 and 2𝜋, using the variable x you just created, store the result 
% in the array y
for i=1:30
    y(i)=sin(x(i)); 
end
%% Task 5: repeat the above without using a for loop
y=sin(x);
%% Task 6: use the plot command, to plot/create a visual representation of
% y as a function of x
figure;
plot(x,y)
%% Task 7: use the xlabel and ylabel commands to add labels to your figure
xlabel('x'); 
ylabel('sin(x)');
%% Task 8: use the plot command, to plot/create a visual representation of 
% 2sin(x) as a function of x
plot(x,2*y)
%% Task 9: use the hold on command to plot both sin(x) and 2sin(x) 
% on the same figure
hold on; 
plot(x,y);

%% Task 10: use the close all command, to close all figures

% close all

% this command was commented out so you can see the example figures!
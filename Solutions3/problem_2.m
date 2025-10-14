clear all
close all
%% Task 1: Create a function with the signature 
% `[x,cp] = readCpData(filename);` 
% which reads the data from the data file.

function [x,cp]=readCpData(filename)
%Open file for reading
if ~isfile(filename)
    error(['File ',char(filename),'does not exist']);
end
fid=fopen(filename,'r');
C = textscan(fid,'%f %f','HeaderLines',1);
x = C{1};
cp = C{2};
%Close file
fclose(fid);
end

%% Task 2: produce a single graph of $$-C_P$$ against $$x/c$$ with all 
% three angles of attack plotted (use different line styles and a 
% legend to distinguish the data sets).

%Read files
[x_00,cp_00]=readCpData('data/naca23015_00degs.txt');
[x_05,cp_05]=readCpData('data/naca23015_05degs.txt');
[x_10,cp_10]=readCpData('data/naca23015_10degs.txt');

%Plot and make pretty
f = figure;
f.Units = "centimeters";
f.Position = [4,4,10,10];
plot(x_00,-cp_00,'rx-')
hold on
plot(x_05,-cp_05,'bs-')
plot(x_10,-cp_10,'gd-')
axis([0 1 -1 3.5])
grid on
xlabel('x/c')
ylabel('-Cp')
lg = legend('0 degs','5 degs','10 degs','Location','NorthEast');
lg.FontSize = 12;
set(gca,'FontSize',12)

function CheckEnvironment(val)
% CHECKENVIRONMENT disable copilot autocompletions
% Inputs:
%   val - (default 0), if zero disable autocompletion, if 1 enables
% Author: Fintan Healy    Date:17/09/2025
arguments
    val double {mustBeMember(val,[0,1])} = 0
end

%% disable auto-complete
s = settings;
try
    s.matlab.editor.autocompletions.EnableAutocompletions.PersonalValue = val;
catch
    warning("Auto Completion setting not changed; does it still exist in this version of MATLAB?")
end

%% check folder sturcture looks correct, ensure the following files exist
% Worksheet_1/problem_1.m
% Worksheet_2/problem_2.m
% Worksheet_3/problem_1.m
% Worksheet_4/problem_1.m

if ~isfile(fullfile(pwd,'Worksheet1','problem_1.m')) || ...
        ~isfile(fullfile(pwd,'Worksheet2','problem_2.m')) || ...
        ~isfile(fullfile(pwd,'Worksheet3','problem_1.m')) || ...
        ~isfile(fullfile(pwd,'Worksheet4','problem_1.m'))
    error('Current folder does not appear to be the root of the i2m_workbooks repository, please change to the correct folder')
else
    disp('------------- Congrats! - Enviroment looks correct -------------')
end

end
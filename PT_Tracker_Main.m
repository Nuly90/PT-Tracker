% PT Tracker Algorithms
% 
% This program is intended to help track my PT so I can measure and report my improvement
% 
% Features:
% Time push-ups/situps
% Calculate reps/min during timed set
% Input variety of exercises
% Calculate calories burned by exercise per day
% Track weight
% Display graph of specific category since given date
% Display table for same thing

clear
close all
clc


% *** Main Frame ***
% All frames centered on 1366 * 768 screen, 800 wide 500 high
% 
% Title: PT TRACKER
% Text box at top of frame
main_frame = myFrame('PT Tracker');

% Four buttons
% 
% Add
% Top left, goes to Add Workout
Add = myButton(main_frame, [.15, .6, .2, .1], 'Add');

% History
% Top right, goes to History
History = myButton(main_frame, [.65, .6, .2, .1], 'History');

% Time
% Bottom left, goes to Time
Time = myButton(main_frame, [.15, .2, .2, .1], 'Time');

% Weight
% Bottom right, goes to Record Weight function
Weight = myButton(main_frame, [.65, .25, .2, .1], 'Record Weight');

% One Edit box
% Weightval - right of Weight button
Weightval = myEdit(main_frame, [.65, .14, .2, .1], '');

 
% *** Add Workout ***
% Title: ADD WORKOUT
% Text box at top of frame
add_workout = myFrame('Add Workout');
set(add_workout, 'Visible', 'off')

% 5 Independent Radiobuttons on left side of frame
% Run
Run = myRadio(add_workout, [.05, .77, .2, .1], 'Run');

% Situps
Situps = myRadio(add_workout, [.05, .61, .2, .1], 'Situps');

% Pushups
Pushups = myRadio(add_workout, [.05, .45, .2, .1], 'Pushups');

% Swim
Swim = myRadio(add_workout, [.05, .29, .2, .1], 'Swim');

% Other
Other = myRadio(add_workout, [.05, .13, .2, .1], 'Other');

% Two text boxes
% Time - right in frame, below title
Timeval = myText(add_workout, [.5, .8, .2, .05], 'Time (DTG): ');

% To - below Time
To = myText(add_workout, [.575, .7, .05, .05], 'To');

% Three edit boxes
% Start - left of To, records start time of workout
Start = myEdit(add_workout, [.425, .7, .15, .05], '');

% Stop - right of To, records stop time of workout
Stop = myEdit(add_workout, [.625, .7, .15, .05], '');

% Others - right of Other, records number of other workouts
Others = myEdit(add_workout, [.3, .13, .1, .1], 'QTY');

% One Button
% Addsets - bottom right, goes to Add Sets. Goes to Name Workouts if Other is selected
Addsets = myButton(add_workout, [.75, .05, .2, .1], 'Add Sets');


% *** Name Workouts ***
% Title: Name Workouts
% Text box at top of frame
name_workouts = myFrame('Name Workouts');
set(name_workouts, 'Visible', 'off')

% One edit box
% Name - left in frame, records name of workout
Name = myEdit(name_workouts, [.15, .7, .3, .15], '');

% One button
% Next - right in frame, adds Name string to list, 
%     string becomes Done when all workouts are named
%     callback changes to Add Sets
Next = myButton(name_workouts, [.55, .7, .3, .15], 'Next');


% *** Add Sets *** 
% Title: ADD SETS
% Text box at top of frame
add_sets = myFrame('Add Sets');
set(add_sets, 'Visible', 'off')

% One List Box
% Workouts - Left in frame, contains each workout
workouts = uicontrol(add_sets, 'Style', 'Listbox', 'Units', 'Normalized');
set(workouts, 'Position', [.05,.05,.2,.7], 'String', {'Rah', 'Yut', 'Kill', 'Slay'})

% One text box
% Sets - Left of right half center line
Sets = myText(add_sets, [.5, .7, .125, .1], 'Sets:');

% One edit box
% Setsnum - Right of Sets
Setsnum = myEdit(add_sets, [.65, .7, .125, .1], '');

% One Button
% Addreps - bottom right, goes to Add Reps.
Addreps = myButton(add_sets, [.75, .05, .2, .1], 'Add Reps');


% *** Time ***
% Title: TIME
% Text box at top of frame
time = myFrame('Time');
set(time, 'Visible', 'off')

% Two Buttons
% Push_ups - Left in frame
push_ups = myButton(time, [.15, .75, .2, .1], 'Push-ups');

% Sit_ups - Right in frame
%     Both go to Timer
sit_ups = myButton(time, [.65, .75, .2, .1], 'Sit-ups');


% *** Timer ***
% Title: Exercise Name
% Text box at top of frame
timer = myFrame('placeholder');
set(timer, 'Visible', 'off')

% Two Text Boxes
% Reps: - Bottom left in frame
Reps = myText(timer, [.05, .4, .15, .1], 'Reps:');

% Counter - Right in frame, displays time of timer
Counter = myText(timer, [.5, .3, .4, .3], '0');
set(Counter, 'Userdata', 0) % 0 = don't count, 1 = count

% One Edit Box
% repcount - Right of Reps:
Repcount = myEdit(timer, [.21, .4, .15, .1], '');

% Three Buttons
% Start - Left in frame, starts counter counting
start = myButton(timer, [.15, .7, .2, .1], 'Start');
set(start, 'Callback', {@starttime, Counter})

% Stop - Right in frame, stops counter from counting
stop = myButton(timer, [.65, .7, .2, .1], 'Stop');
set(stop, 'Callback', {@stoptime, Counter})

% Done - Goes to main frame
done = myButton(timer, [.75, .05, .2, .1], 'Done');


% *** History ***
% Title: HISTORY
% Text box at top of frame
history = myFrame('History');
set(history, 'Visible', 'off')

% One Listbox
% Left in frame, lists categories
categories = uicontrol(history, 'Style', 'ListBox', 'Units', 'Normalized');
set(categories, 'Position', [.05,.1,.3,.7], 'String', {'Rah', 'Yut', 'Kill', 'Slay'})

% One Text Box
% Since (DDMMMYY): Right of Listbox
since = myText(history, [.4,.75,.25,.05], 'Since (DDMMMYY):');

% One Edit Box
% StTime - Right of Since
sinceval = myEdit(history, [.7,.75,.25,.05], '');

% Three Buttons
% Table - Below StTime, displays table for selected category
table = myButton(history, [.575,.55,.2,.1], 'Table');

% Graph - Below Table, plots data for selected category
graph = myButton(history, [.575,.4,.2,.1], 'Graph');

% Back - Bottom right, goes to main frame
back = myButton(history, [.75, .05, .2, .1], 'Back');

% Set Button Callbacks
set(Add, 'Callback', {@switchframe, main_frame, add_workout})
set(Addsets, 'Callback', {@addsets, add_workout, name_workouts, add_sets,...
    Run, Pushups, Situps, Swim, Other, Others, Next, workouts})
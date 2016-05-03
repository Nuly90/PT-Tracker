function recordreps(hObject, Eventdata, main_frame, add_sets, workouts, reps, add_reps)

% This function saves the repetitions from a workout in the user data of
% the main frame, removes the selected workout from the list, and goes back
% to add sets until all workouts have sets and reps.

% Get the number of reps in each set
repvals = [];
for i = reps
    repvals = [repvals, str2double(get(i, 'String'))];
end

% Get the total number of reps
repstotal = sum(repvals);

% Create a data slice to describe the workout
Workouts = get(workouts, 'String');
workout = Workouts{get(workouts, 'Value')};
repstr = sprintf('%d,', repvals);
slice = {workout, repstr, repstotal};

% Save the slice to main frame userdata
UD = get(main_frame, 'Userdata');
UD = [UD, slice]
set(main_frame, 'Userdata', UD)

% Delete the workout whose sets have been defined
Workouts(get(workouts, 'Value')) = [];
set(workouts, 'String', Workouts)
set(workouts, 'Value', 1)

% If there are workouts left, go to add sets
if ~isempty(Workouts)
    switchframe(1, 1, add_reps, add_sets)
    
% Otherwise go to main frame and save data to history
else
    switchframe(1, 1, add_reps, main_frame)

end

end
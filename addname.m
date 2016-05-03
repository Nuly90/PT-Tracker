function addname(hObject, Eventdata, name_workouts, add_sets, Name, Run,...
    Pushups, Situps, Swim, workouts)

% This function adds the user-provided names of workouts to the userdata of
% the frame until the number of custom workouts has been exhausted. After
% this, it changes the string and callback of its own button to go to add
% sets.

% Get the name provided by the user
name = {get(Name, 'String')};

% Save the name to the frame userdata
names = get(name_workouts, 'Userdata');
names = [names, name];
set(name_workouts, 'Userdata', names)
set(Name, 'String', '')

% Remove one from the number of iterations
iterations = get(hObject, 'Userdata');
iterations = iterations - 1;
set(hObject, 'Userdata', iterations)

% If 1 iterations remaining, change string of button
if iterations == 1
    set(hObject, 'String', 'Done')
elseif ~iterations
    
    % If no iterations remaining, switch to add sets and change string back
    
    % Check which radio buttons have been selected
    Workouts(1) = get(Run, 'Value');
    Workouts(2) = get(Pushups, 'Value');
    Workouts(3) = get(Situps, 'Value');
    Workouts(4) = get(Swim, 'Value');
    
    % Set the list box string in add sets and go to add sets
    workoutnames = {'Run', 'Pushups', 'Situps', 'Swim'};
    names = get(name_workouts, 'Userdata');
    for i = 1:4
        if Workouts(i)
            names = [names, workoutnames(i)];
        end
    end
    
    set(workouts, 'String', names)
    switchframe(1, 1, name_workouts, add_sets)
    set(hObject, 'String', 'Next')
end

end
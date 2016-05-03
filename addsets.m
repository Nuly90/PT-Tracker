function addsets(hObject, Eventdata, add_workout, name_workouts, add_sets,...
    Run, Pushups, Situps, Swim, Other, Others, Next, workouts)

% This function goes to name workouts for each category indicated with
% Other and Others, then modifies the list box in add sets to include all
% indicated workouts and goes to add sets.

% Check which radio buttons have been selected
Workouts(1) = get(Run, 'Value');
Workouts(2) = get(Pushups, 'Value');
Workouts(3) = get(Situps, 'Value');
Workouts(4) = get(Swim, 'Value');
other = get(Other, 'Value');

% If Other has been selected, go to name workout with the number of Others
% encoded in the next button
if other
    set(Next, 'Userdata', str2double(get(Others, 'String')))
    switchframe(1, 1, add_workout, name_workouts)
else
    % Otherwise set the list box string in add sets and go to add sets
    workoutnames = {'Run', 'Pushups', 'Situps', 'Swim'};
    names = {};
    for i = 1:4
        if Workouts(i)
            names = [names, workoutnames(i)];
        end
        
        set(workouts, 'String', names)
        switchframe(1, 1, add_workout, add_sets)
    end

set(workouts, 'String', names)
end

end
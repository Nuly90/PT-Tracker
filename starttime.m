function starttime(hObject, EventData, Counter)

% Starts the timer for PT Tracker by iterating and increasing the time
% showed in the display by the amount of time required for each iteration.
% Most likely only works on this computer. May include calibration feature
% in future edition.

set(Counter, 'Userdata', 1)
run = 1;
time = 0;
while run
    pause(0.001)
    time = time + 0.016; % Change this value to calibrate
    timestr = num2str(time);
    set(Counter, 'String', timestr)
    run = get(Counter, 'Userdata');
end

end
function fh = myFrame(Title)

% Returns a frame centered on 1366 * 768 screen, 800 wide 500 high
% with no menubar, the name PT TRACKER, and a title centered in the top of
% the frame

fh = figure('Menubar', 'none', 'Numbertitle', 'off', 'Name', 'PT TRACKER');
set(fh, 'Position', [283, 134, 800, 500], 'Resize', 'off')

title = uicontrol(fh, 'Style', 'Text', 'Units', 'Normalized');
set(title, 'Position', [0.3, 0.9, 0.4, 0.1], 'String', Title)
set(title, 'FontSize', 30)

end
function bh = myButton(fh, Position, String)

% Creates a pushbutton with units normalized, at position specified, with
% string specified, with font size proportional to the height

fontsize = 150 * Position(4);

bh = uicontrol(fh, 'Style', 'Pushbutton', 'Units', 'Normalized');
set(bh, 'String', String, 'Position', Position, 'FontSize', fontsize)

end
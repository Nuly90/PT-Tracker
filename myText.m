function bh = myText(fh, Position, String)

% Creates a Text Box with units normalized, at position specified, with
% string specified, with font size proportional to the height

fontsize = 300 * Position(4);

bh = uicontrol(fh, 'Style', 'Text', 'Units', 'Normalized');
set(bh, 'String', String, 'Position', Position, 'FontSize', fontsize)

end
function write_svg(filename, svg_lines)

% open the file
fid = fopen(filename, 'w');

% write the contents
for i = 1:numel(svg_lines)
    line = svg_lines(i).char; % string to char
    line = padnewline(line); % add newline
    fprintf(fid, line);
end

% close the file
fclose(fid);

end

function [chars] = padnewline(chars)

newline = '\n';
if ~endsWith(chars, newline)
    chars = strcat(chars, newline);
end

end

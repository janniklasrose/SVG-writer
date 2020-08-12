function [base64] = image2base64(image)

% # https://stackoverflow.com/a/26595628
% <img src="data:[mime type;][charset=<charset>;][base64,][base64 data]"> // formula
% <image src='data:image/png;base64,SGVsbG8s...IHdvcmxkIQ='></image>" // shortened example

% https://blogs.mathworks.com/pick/2018/02/02/new-mathworks-tools/

% base64 Table
%{
0 A
...
25 Z
26 a
...
51 z
52 0
61 9
62 +
63 /
%}

% optional input format
if ~ischar(image) % assume is numeric data instead of filename
    file = tempname(tempdir()); % unique path
    file = [file, '.png']; % assume PNG!
    somedate = datenum(2000, 1, 1); % otherwise the imwrite files are not reproducibly identical
    opts = {'CreationTime', somedate, 'ImageModTime', somedate};
    imwrite(image, file, opts{:}); % write to a temporary file
    image = file; % use the name of this file as if it was given as input
end

% read data
if isfile(image)
    fid = fopen(image, 'r', 'b');
    image_binary = fread(fid); % read everything
    fclose(fid);
else
    error('image has to be a valid file');
end

import matlab.net.* % needed?
base64 = matlab.net.base64encode(image_binary(:));

end

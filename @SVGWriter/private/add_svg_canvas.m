function [svgheader, svgfooter] = add_svg_canvas(canvas_size, cm_per_px)

svgheader = add_header(canvas_size, cm_per_px);
svgfooter = add_footer();

end

function [header] = add_header(canvas_size, cm_per_px)

canvas_size_px = transpose(canvas_size(:)); % [width, height]
canvas_size_cm = canvas_size * cm_per_px;

% we need canvas_size, otherwise the shapes have no reference
str_canvas_size = sprintf('width="%dcm" height="%dcm"', canvas_size_cm);

%TODO: Why viewBox?
str_canvas_view = sprintf('viewBox="%d %d %d %d"', [0, 0, canvas_size_px]);

%TODO: why this exactly?
str_canvas_xmlns = 'xmlns="http://www.w3.org/2000/svg"'; %TODO: can we use 'xmlns="full"'?
str_canvas_version = 'version="1.1"';

% combine
header = "<svg";
header = header.append([' ', str_canvas_size]);
header = header.append([' ', str_canvas_view]);
header = header.append([' ', str_canvas_xmlns]);
header = header.append([' ', str_canvas_version]);
header = header.append('>');

end

function [footer] = add_footer()

footer = "</svg>";

end

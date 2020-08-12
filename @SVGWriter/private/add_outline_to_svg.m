function [str_outline] = add_outline_to_svg(x, y, stroke_c, stroke_w)

str_style = sprintf('fill="none" stroke="%s" stroke-width="%d"', stroke_c, stroke_w);
str_bbox = sprintf('x="%d" y="%d" width="%d" height="%d"', x(1)-1, y(1)-1, diff(x)+2, diff(y)+2);
str_outline = ['<rect ',str_bbox,' ',str_style,' />'];

end

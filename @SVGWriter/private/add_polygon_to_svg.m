function [str_polygon] = add_polygon_to_svg(polygon, fill_c, stroke_c, stroke_w)

% https://www.w3.org/TR/SVG11/shapes.html#PolygonElement

points = transpose(polygon.Vertices);
str_points = strtrim(sprintf('%d,%d ', points));

str_style = sprintf('fill:%s;stroke:%s;stroke-width:%d', fill_c, stroke_c, stroke_w);
str_polygon = sprintf('<polygon style="%s" points="%s" />', str_style, str_points);

end

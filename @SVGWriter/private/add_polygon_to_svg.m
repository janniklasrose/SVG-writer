function [str_polygon] = add_polygon_to_svg(polygon, varargin)

% https://www.w3.org/TR/SVG11/shapes.html#PolygonElement

% parse optional style arguments
style = parse_styles(varargin{:});

% add vertices to points string
vertexPairs = transpose(polygon.Vertices);
points = string(sprintf('%d,%d ', vertexPairs)).strip;

% combine style and points
str_polygon = sprintf('<polygon style="%s" points="%s"/>', style.char, points.char);

end

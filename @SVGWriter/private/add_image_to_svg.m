function [str_image] = add_image_to_svg(image, pos)

% https://www.w3.org/TR/SVG/struct.html#ImageElement
% https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/SVG_Image_Tag
% https://stackoverflow.com/questions/6249664/does-svg-support-embedding-of-bitmap-images

% add image metadata
id = 'imagePNG';
x = pos(1);
y = pos(2);
[height, width] = size(image, [1, 2]);
% 'transform="rotate(45)"'
str_meta = sprintf('id="%s" x="%d" y="%d" width="%d" height="%d"', id, x, y, width, height);

% embed the image
image_base64 = image2base64(image);
str_bits = sprintf('href="data:image/png;base64,%s"', image_base64); % used to be xlink:href, now deprecated

% combine
str_image = sprintf('<image %s %s/>', str_meta, str_bits);

end

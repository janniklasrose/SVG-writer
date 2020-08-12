function [header, footer] = add_svg_file()

header = add_doc_header();
footer = add_doc_footer();

end

function str = add_doc_header()

str_xml = "<?xml version=""1.0"" standalone=""no""?>";
str_doc = "<!DOCTYPE svg PUBLIC ""-//W3C//DTD SVG 1.1//EN"" ""http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"">";
str = [str_xml; str_doc];

%TODO: what about these?
%'<!DOCTYPE html>'
%'<html>'
%'<body>'

end

function str = add_doc_footer()

str = [];

%TODO: what about these?
%'</body>'
%'</html>'

end

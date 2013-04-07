%Author:Amod Mulay
function output_Img = weinerClindrical(input_Img, radius)
if nargin < 2
    radius = 1;
end
output_Img = double(zeros(size(input_Img)));
filter_range = int8(radius);
if(radius<1)
    filter_range = int8(1);
elseif (radius > 10)
    filter_range = int8(10);
end
radius = double(radius);
filter_size = 2*filter_range+1; % = 3 in default case
filter_buffer = double(zeros((2*filter_range+1),(2*filter_range+1)));
%height = 1/(3.14 * radius * radius);

for i=1:size(filter_buffer,1)
    for j=1:size(filter_buffer,2)
        if( ((i - radius -1)*(i - radius -1) + (j - radius -1)*(j - radius -1)) <= radius*radius)
            filter_buffer(i,j) = 1.0;
        end
    end
end

%filter_buffer
correction = 0;
for i=1:size(filter_buffer,1)
    for j=1:size(filter_buffer,2)
        correction = correction +filter_buffer(i,j);
    end
end

%correction
filter_buffer = filter_buffer /correction; 
input_Img = double(input_Img);

output_Img = deconvwnr(input_Img,filter_buffer);
output_Img = uint8(output_Img);
end
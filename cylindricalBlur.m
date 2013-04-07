function output_Img = cylindricalBlur(input_Img, radius)
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
filter_size=2*filter_range+1; % = 3 in default case
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
        correction = correction + filter_buffer(i,j);
    end
end

%correction
filter_buffer = filter_buffer/correction; %better estimate of height since sum will always be 1
input_Img_double = double(input_Img);

for i=1:size(input_Img,1)
    for j=1:size(input_Img,2)
        total = double(0);
        for a = -filter_range:filter_range
            for b = -filter_range:filter_range
                x = i+a;
                y = j+b;
                if(x < 1)
                    x=-x+1;
                elseif x>size(input_Img,1)
                    x= 2*size(input_Img,1) - x;
                end
                if(y<1)
                    y=-y+1;
                elseif y>size(input_Img,2)
                    y= 2*size(input_Img,2) - y;
                end
                total = total + filter_buffer(radius+1-a,radius+1-b) * input_Img_double(x,y) ;               
            end
        end
        output_Img(i,j) = total;
        %sum = filter_buffer(indices(1));  
        %size(filter_buffer)
    end
end
output_Img = uint8(output_Img);
end
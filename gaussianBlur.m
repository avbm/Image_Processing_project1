function output_Img = gaussianBlur(input_Img, sigma)
if nargin < 2
    sigma =1;
end
output_Img = double(zeros(size(input_Img)));
filter_range = int8(2*sigma);
if(sigma<1)
    filter_range = int8(1);
elseif (sigma > 10)
    filter_range = int8(10);
end
sigma = double(sigma);
filter_size=2*int8(filter_range)+1; % = 5 in default case
filter_buffer = double(zeros((filter_size),1));

for i=1:size(filter_buffer,1)
    p= i - sigma -1;
    filter_buffer(i) = 1/(sqrt(6.28)*sigma) * exp(-(p*p)/(2*sigma*sigma));        
end

correction = 0;
for i=1:size(filter_buffer,1)
    correction += filter_buffer(i);
end
filter_buffer /= correction; % correction is used to ensure that sum of filter = 1
%correction
%filter_buffer
%size(filter_buffer)
input_Img_double = double(input_Img);
output_Img_temp = double(zeros(size(input_Img)));

for i=1:size(input_Img,1)
    for j=1:size(input_Img,2)
        total= 0 ;%double(zeros(filter_size,1));
        for b = -filter_range:filter_range
            y = j+b;
            if(y<1)
                y=-y+1;
            elseif y>size(input_Img,2)
                y= 2*size(input_Img,2) - y;
            end
            total += filter_buffer(filter_range-b+1) * input_Img_double(i,y) ;               
        end
        output_Img_temp(i,j) = total;
    end
end
%subplot(1,2,1), imshow(input_Img);
%subplot(1,2,2), imshow(output_Img_temp);
%input("wait for enter");

for i=1:size(input_Img,1)
    for j=1:size(input_Img,2)
        total = 0;
        for a = -filter_range:filter_range
            x = i+a;
            if(x < 1)
                x=-x+1;
            elseif x>size(input_Img,1)
                x= 2*size(input_Img,1) - x;
            end
            total += filter_buffer(filter_range-a+1) * output_Img_temp(x,j) ;  
        end
        output_Img(i,j) = total;
        %sum = filter_buffer(indices(1));  
        %size(filter_buffer)
    end
end
output_Img = uint8(output_Img);
end
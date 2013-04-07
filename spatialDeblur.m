%Author:Amod Mulay
%Notes: The code has been implemented as instructed in class
%filter_buffer = sigma*sigma/4 *[1 1 1; 1 -8 1; 1 1 1] is a better approximation

function output_Img = spatialDeblur(input_Img, sigma)
if nargin <2
    sigma =1 ;
end
output_Img = double(zeros(size(input_Img)));
sigma = double(sigma);
input_Img = double(input_Img);
%output_Img = input_Img ;
%sigma=2;
filter_buffer = sigma*sigma/4 *[1 1 1; 1 -8 1; 1 1 1];
filter_buffer = [ 0 0 0; 0 1 0; 0 0 0] - filter_buffer;
%filter_buffer = sigma*sigma/4 *[0 1 0; 1 -4 1; 0 1 0]; 
filter_range = 1;
filter_size=2*filter_range+1;

%filter_buffer = 1 + sigma*sigma/4 * filter_buffer;
filter_buffer
for i=1:size(input_Img,1)
    for j=1:size(input_Img,2)
        %temp = 0;
        for a = -filter_range:filter_range
            for b = -filter_range:filter_range
                x = i+a;
                y = j+b;
                if(x < 1)
                    x=-x+1;
                elseif x>size(input_Img,1)
                    x= 2*size(input_Img,1) - x;
                else
                    x = x;
                end
                if(y<1)
                    y=-y+1;
                elseif y>size(input_Img,2)
                    y= 2*size(input_Img,2) - y;
                else
                    y = y;
                end
                output_Img(i,j) = output_Img(i,j)+filter_buffer(2+a,2+b)*input_Img(x,y);
            end
        end
        %output_Img(i,j) -= temp; 
    end
end
end

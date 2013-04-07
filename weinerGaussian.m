%Author:Amod Mulay
function output_Img = weinerGaussian(input_Img, sigma)
if nargin < 2
    sigma = 1;
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
filter_buffer = double(zeros((filter_size),(filter_size)));

for i=1:size(filter_buffer,1)
    p= i - sigma -1;
    for j=1:size(filter_buffer,2)
        q= j - sigma -1;
        filter_buffer(i,j) = 1/((6.28)*sigma) * exp(-(p*p+q*q)/(2*sigma*sigma));
    end
end

%filter_buffer
correction = 0;
for i=1:size(filter_buffer,1)
    for j=1:size(filter_buffer,2)
        correction = correction +filter_buffer(i,j);
    end
end
filter_buffer = filter_buffer /correction; 

input_Img = double(input_Img);output_Img = deconvwnr(input_Img,filter_buffer);
output_Img = uint8(output_Img);
end
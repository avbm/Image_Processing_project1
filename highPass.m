function output_Img = highPass(input_Img, optimize_level)
if nargin < 2
    level = 1;
end
output_Img = double(zeros(size(input_Img)));

filter_buffer = 1 + double(zeros(size(input_Img)));
filter_buffer(1:4,1:4) = 0.5;
if(optimize_level ==0)
    output_Img = abs(idft2(filter_buffer .* dft2(input_Img)));
else
    output_Img = abs(ifft2(filter_buffer .* fft2(input_Img)));
end

end
function [output_Mat_real, output_Mat_img]  = dft(input_Mat);
M = size(input_Mat,1);
N = size(input_Mat,2);

output_Mat_real = double(zeros(size(input_Mat)));
output_Mat_img = double(zeros(size(input_Mat)));
%output_Mat_real_temp = double(zeros(size(input_Mat,2)));
%output_Mat_img_temp = double(zeros(size(input_Mat,2)));
input_Mat = double(input_Mat);

for u=1:M
    for v=1:N
        for m=1:M
        %temp_real = 0;
        %temp_img = 0;
            for n=1:N
                theta = (-2*pi*(u-1)*(m-1)/M)+(-2*pi*(v-1)*(n-1)/N);
                output_Mat_real(u,v) += input_Mat(m,n)*cos(theta);
                output_Mat_img(u,v) += input_Mat(m,n)*sin(theta);
           endfor
        endfor
        %output_Mat_real(u,v) = temp_real;
        %output_Mat_img(u,v) = temp_img;
    endfor
endfor

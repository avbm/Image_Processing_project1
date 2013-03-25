%Author: Amod Mulay
%This is the inverse dft function. It is essentially the same as dft except for 
%the change in sign of theta. Implemented as a seperable function.



function [output_Mat_real, output_Mat_img]  = idft_sep(input_Mat);
M = size(input_Mat,1);
N = size(input_Mat,2);

output_Mat_real = double(zeros(size(input_Mat)));
output_Mat_img = double(zeros(size(input_Mat)));

input_Mat = double(input_Mat);

for u=1:M
    for v=1:N
        temp_real = 0;
        temp_img = 0;
        output_Mat_real_temp = double(zeros(size(input_Mat,1),1));
        output_Mat_img_temp = double(zeros(size(input_Mat,1),1));
        for n=1:N
            theta = (2*pi*(v-1)*(n-1)/N);
            output_Mat_real_temp += input_Mat(:,n)*cos(theta);
            output_Mat_img_temp += input_Mat(:,n)*sin(theta);
        endfor
        for m=1:M
            theta = (2*pi*(u-1)*(m-1)/M);
            c = cos(theta);
            s = sin(theta);
            temp_real += c*output_Mat_real_temp(m) - s*output_Mat_img_temp(m);
            temp_img += s*output_Mat_real_temp(m) + c*output_Mat_img_temp(m);
        endfor
        output_Mat_real(u,v) = temp_real;
        output_Mat_img(u,v) = temp_img;
    endfor
endfor

function output_Mat = dft2_sep(input_Mat);

M = size(input_Mat,1);
N = size(input_Mat,2);

output_Mat = zeros(size(input_Mat));
input_Mat = double(input_Mat);

for u=1:M
    for v=1:N
        temp_real = 0;
        temp_img = 0;
        output_Mat_temp = (zeros(size(input_Mat,1),1));
        for n=1:N
            theta = (-2*sqrt(-1)*pi*(v-1)*(n-1)/N);
            output_Mat_temp += input_Mat(:,n)*exp(theta);
        endfor
        for m=1:M
            theta = (-2*sqrt(-1)*pi*(u-1)*(m-1)/M);
            output_Mat(u,v) += output_Mat_temp(m)*exp(theta);
        endfor
    endfor
endfor

function output_Mat = idft2(input_Mat)

M = size(input_Mat,1);
N = size(input_Mat,2);

output_Mat = zeros(size(input_Mat));
input_Mat = double(input_Mat);
KN = 2*sqrt(-1)*pi/N;
KM = 2*sqrt(-1)*pi/M;
K = (1/(M*N));

for u=1:M
    for v=1:N
        output_Mat_temp = (zeros(size(input_Mat,1),1));
        for n=1:N
            theta = (KN*(v-1)*(n-1));
            output_Mat_temp = output_Mat_temp+input_Mat(:,n)*exp(theta);
        end
        for m=1:M
            theta = (KM*(u-1)*(m-1));
            output_Mat(u,v) = output_Mat(u,v)+output_Mat_temp(m)*exp(theta);
        end
    end
end

output_Mat = output_Mat*K;
end
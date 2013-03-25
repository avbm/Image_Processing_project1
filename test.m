%pseudo function for testing code
function return_value = test(input_IMG);
Img = imread (input_IMG);
Img_gray = grayscale(Img);
input_Img = Img_gray;
return_value = 1;
radius=1;
input_Img = double(input_Img);

temp1 = input_Img(1:10,1:10);% fft(input_Img(1:10,1:10));
temp2 = idft2(dft2(input_Img(1:10,1:10)));
(temp1-temp2)./temp1 *100
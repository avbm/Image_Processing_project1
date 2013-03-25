%Author: Amod Mulay
%Notes: The commented part is the oriinal implementation using for loops
%however finally an inline implementation was used which gives a better performance
function gray = grayscale(Img);
Img_float = uint16(Img);
gray = uint16(zeros(size(Img_float,1),size(Img_float,2)));
%for i = 1:size(Img,1)
%    for j = 1:size(Img,2)
%
%        gray(i,j) = (( Img_float(i,j,1) + Img_float(i,j,2) + Img_float(i,j,3))/3);
%    endfor
%endfor
%if (size(Img_float,3)==3)
%    gray = ((Img_float(:,:,1)+Img_float(:,:,2)+Img_float(:,:,3))/3);
%else
%    gray = Img_float;
%endif

for i=1:size(Img_float,3)
    gray += (Img_float(:,:,i));
endfor
gray = gray/size(Img_float,3);

gray = uint8(gray);
%Author: Amod Mulay
%Notes: There are a few sanity checks to make sure all the variables are in
%bounds before the actual computation takes place
function output_Img = imgZoom(input_Img, zoomFactor);
output_Img = 1;
if (zoomFactor*size(input_Img,1) <= 1) or (zoomFactor*size(input_Img,2) <= 1)
    "zoomFactor reduces image to size less than 1 px"
endif
output_Img = zeros(uint16(zoomFactor*size(input_Img)));
input_Img_uint16 = double(input_Img);
for i=1:size(output_Img,1)
    x = i/double(zoomFactor);
    if x<1
        x = 1;
    elseif x>size(input_Img,1)
        x=size(input_Img,1)        
    endif
    X0 = uint16(x);
    if(X0 >= size(input_Img,1))
        X1 = X0;
    else
        X1 = X0+1;
    endif
    for j=1:size(output_Img,2)
        y = j/double(zoomFactor);
        if(y<1)
            y=1;
        elseif y>size(input_Img,2)
            y=size(input_Img,2) ;
        endif
        Y0 = uint16(y);
        if(Y0 >= size(input_Img,2))
            Y1 = Y0;
        else
            Y1 = Y0+1;
        endif
        I1 = (double(Y1)-y) * input_Img_uint16(X0,Y0) + (y-double(Y0)) * input_Img_uint16(X0,Y1);
        I2 = (double(Y1)-y) * input_Img_uint16(X1,Y0) + (y-double(Y0)) * input_Img_uint16(X1,Y1);
        output_Img(i,j) = (double(X1) -x) * I1 + (x-double(X0)) * I2;
    endfor
endfor
output_Img = uint8(output_Img);

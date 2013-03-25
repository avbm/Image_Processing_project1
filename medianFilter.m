%Author: Amod Mulay
%Notes: There are a few sanity checks to make sure all the variables are in
%bounds before the actual computation takes place
%the filter values are stored in a 1D array instead of a matrix to make obtaining the median easier
function output_Img = medianFilter(input_Img);
output_Img = uint8(zeros(size(input_Img)));
filter_range = 2;
filter_size=2*filter_range+1; % = 5 in this case
filter_buffer = zeros((2*filter_range+1)*(2*filter_range+1),1);
%size(filter_buffer)
for i=1:size(input_Img,1)
    for j=1:size(input_Img,2)
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
                endif
                if(y<1)
                    y=-y+1;
                elseif y>size(input_Img,2)
                    y= 2*size(input_Img,2) - y;
                else
                    y = y;
                endif
                filter_buffer(filter_size*(a+filter_range)+(b+filter_range)+1) = input_Img(x,y);
            endfor
        endfor
        output_Img(i,j)=median(filter_buffer);
    endfor
endfor




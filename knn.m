%Author: Amod Mulay
%Notes:
%1> There are a few sanity checks to make sure all the variables are in
%   bounds before the actual computation takes place
%2> instead of storing actual values for k nearest neighbors, the average of the 
%   differences is added to the reference value(which is the original pixel intensity)
function output_Img = knn(input_Img, k=1);
output_Img = uint16(zeros(size(input_Img)));
filter_range = 1;
filter_size=2*filter_range+1; % = 3 in this case
filter_buffer = zeros((2*filter_range+1)*(2*filter_range+1),1);
filter_buffer_sort = zeros(size(filter_buffer));
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
                filter_buffer(filter_size*(a+filter_range)+(b+filter_range)+1) = input_Img(x,y)-input_Img(i,j);
            endfor
        endfor
        [filter_buffer_sort,indices]=sort(abs(filter_buffer));
        %sum = filter_buffer(indices(1));  
        %size(filter_buffer)
        sum = 0;
        for a = 1:k
            sum += filter_buffer(indices(a));
        endfor
        output_Img(i,j)= input_Img(i,j) + double(sum)/k;
    endfor
endfor
output_Img = uint8(output_Img);



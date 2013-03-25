function return_value = project1(input_IMG);
return_value = "Error";
Img = imread (input_IMG);
Img_gray = grayscale(Img);
%imshow(Img_gray,map);
part = input("Enter the operation:\n \
    1: Zoom\n \
    2: Median Filter\n \
    3: KNN Filter\n \
    4: Cylindrical Blur\n \
    5: Gaussian Blur\n \
    6: Spatial Deblur(Cylindrical)\n \
    7: Spatial Deblur(Gaussian)\n \
    8: Inverse Cylindrical Blur\n \
    9: Inverse Gaussian Blur\n \
   10: Weiner filter for Cylindrical Blur\n \
   11: Weiner filter for Gaussian Blur\n \
   12: High Pass Filter\n \
    option:");
%part = 7;
switch (part)
    case 1
        zoom = input("Enter zoom factor (0.25 - 4):");
        output_IMG = imgZoom(Img_gray , zoom);
    case 2
        output_IMG = medianFilter(Img_gray);
    case 3
        output_IMG = knn(Img_gray,4); %k=4 set as per assignment
    case 4
        radius = input("Enter radius of blur circle in pixels(1 - 10):");
        output_IMG = cylindricalBlur(Img_gray, radius);
        imwrite(output_IMG,"cylindricalBlur.png");
    case 5
        sigma = input("Enter sigma in pixels(1 - 10):");
        output_IMG = gaussianBlur(Img_gray, sigma);
        imwrite(output_IMG,"gaussianBlur.png");
    case 6
        radius = input("Enter radius of original blur circle in pixels:");
        output_IMG = spatialDeblur(Img_gray, radius/sqrt(2));
    case 7
        sigma = input("Enter deblur parameter sigma in pixels:");
        output_IMG = spatialDeblur(Img_gray, sigma);
    case 8
        radius = input("Enter radius of original blur circle in pixels(1 - 10):");
        output_IMG = inverseCylindricalBlur(Img_gray, radius);
    case 9
        sigma = input("Enter sigma in pixels(1 - 10):");
        output_IMG = inverseGaussianBlur(Img_gray, sigma);
    case 10
        radius = input("Enter radius of original blur circle in pixels(1 - 10):");
        output_IMG = weinerCylindrical(Img_gray, radius);
    case 11
        sigma = input("Enter sigma in pixels(1 - 10):");
        output_IMG = weinerGaussian(Img_gray, sigma);
    case 12
        Img_gray = Img_gray(1:128,1:128);
        optimize_level = input("Enter optimization level:\n\
            0: use user defined dft algorithm\n\
            1: use in-built fft algorithm\n\
            optimize_level:");
        output_IMG = highPass(Img_gray, optimize_level);    
    otherwise
        output_IMG = Img_gray;
        "Invalid Input"
endswitch
%output_IMG
output_IMG = uint8((output_IMG));
%part1 = imgZoom(Img_gray , 0.5);
%part2 = medianFilter(Img_gray);
%part3 = knn(Img_gray,4);
%subplot(1,2,1), imshow(Img);
subplot(1,2,1), imshow(Img_gray);
subplot(1,2,2), imshow(output_IMG);
return_value = "Program Exited Successfully\n";
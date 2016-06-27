%GaussianFilter
input = imread('plane.pgm');
imshow(input);
gaussianOutput = GaussianFilter(input, 5);
imshow(gaussianOutput);

%SobelFilter
sobelOutput = SobelFilter(gaussianOutput, 0.3);
imshow(sobelOutput);

%NonMaximumSuppression-Canny edge detector
cannyOutput = NonMaxSuppression(sobelOutput);
imshow(cannyOutput);

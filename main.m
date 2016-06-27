% input = imread('road.png');
% imshow(input);
% Output = hough(input);
% imshow(Output);

%GaussianFilter
input = imread('road.png');
imshow(input);
gaussianOutput = GaussianFilter(input, 1);
imshow(gaussianOutput);

%SobelFilter
sobelOutput = SobelFilter(gaussianOutput);
imshow(sobelOutput);

%Hessian Detector
hessianOutput = HessianDetector4(sobelOutput);
imshow(hessianOutput);


%NonMaximumSuppression-Canny edge detector
nmsOutput = NonMaxSuppression2(hessianOutput);
imshow(nmsOutput);

%RANSAC
%ransacOuput = RANSACimp(nmsOutput, 5, 5);
%imshow(ransacOuput)

%DrawLine = DrawLineWithTwoPoints(hessianOuput);
%BW = edge(input,'canny');
%imshow(BW);
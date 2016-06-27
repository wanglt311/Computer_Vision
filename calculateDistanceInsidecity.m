function minDistance = calculateDistanceInsidecity(inputImageInsidecityTest)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%minDist = zeros(1,4);
binNum = 6;
inputImageInsidecityTrain1 = imread('insidecity_train1.jpg');
trainHistogram1 = Histogram(inputImageInsidecityTrain1, binNum);

inputImageInsidecityTrain2 = imread('insidecity_train2.jpg');
trainHistogram2 = Histogram(inputImageInsidecityTrain2, binNum);

inputImageInsidecityTrain3 = imread('insidecity_train3.jpg');
trainHistogram3 = Histogram(inputImageInsidecityTrain3, binNum);

inputImageInsidecityTrain4 = imread('insidecity_train4.jpg');
trainHistogram4 = Histogram(inputImageInsidecityTrain4, binNum);

histogramInsidecityTest = Histogram(inputImageInsidecityTest, binNum);

dist1 = (sum((trainHistogram1 - histogramInsidecityTest).^2))^0.5;
dist2 = (sum((trainHistogram2 - histogramInsidecityTest).^2))^0.5;
dist3 = (sum((trainHistogram3 - histogramInsidecityTest).^2))^0.5;
dist4 = (sum((trainHistogram4 - histogramInsidecityTest).^2))^0.5;

minDist = [dist1, dist2, dist3, dist4];
minDistance = min(minDist);

end


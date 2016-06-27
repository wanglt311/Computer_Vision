function minDistance = calculateDistanceForest(inputImageForestTest)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%minDist = zeros(1,4);
binNum = 6;
inputImageForestTrain1 = imread('forest_train1.jpg');
trainHistogram1 = Histogram(inputImageForestTrain1, binNum);

inputImageForestTrain2 = imread('forest_train2.jpg');
trainHistogram2 = Histogram(inputImageForestTrain2, binNum);

inputImageForestTrain3 = imread('forest_train3.jpg');
trainHistogram3 = Histogram(inputImageForestTrain3, binNum);

inputImageForestTrain4 = imread('forest_train4.jpg');
trainHistogram4 = Histogram(inputImageForestTrain4, binNum);

histogramForestTest = Histogram(inputImageForestTest, binNum);

dist1 = (sum((trainHistogram1 - histogramForestTest).^2))^0.5;
dist2 = (sum((trainHistogram2 - histogramForestTest).^2))^0.5;
dist3 = (sum((trainHistogram3 - histogramForestTest).^2))^0.5;
dist4 = (sum((trainHistogram4 - histogramForestTest).^2))^0.5;

minDist = [dist1, dist2, dist3, dist4];
minDistance = min(minDist);

end


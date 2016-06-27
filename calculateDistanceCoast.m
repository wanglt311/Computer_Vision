function minDistance = calculateDistanceCoast(inputImageCoastTest)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%minDist = zeros(1,4);
binNum = 6;
inputImageCoastTrain1 = imread('coast_train1.jpg');
trainHistogram1 = Histogram(inputImageCoastTrain1, binNum);

inputImageCoastTrain2 = imread('coast_train2.jpg');
trainHistogram2 = Histogram(inputImageCoastTrain2, binNum);

inputImageCoastTrain3 = imread('coast_train3.jpg');
trainHistogram3 = Histogram(inputImageCoastTrain3, binNum);

inputImageCoastTrain4 = imread('coast_train4.jpg');
trainHistogram4 = Histogram(inputImageCoastTrain4, binNum);

histogramCoastTest = Histogram(inputImageCoastTest, binNum);

dist1 = (sum((trainHistogram1 - histogramCoastTest).^2))^0.5;
dist2 = (sum((trainHistogram2 - histogramCoastTest).^2))^0.5;
dist3 = (sum((trainHistogram3 - histogramCoastTest).^2))^0.5;
dist4 = (sum((trainHistogram4 - histogramCoastTest).^2))^0.5;

minDist = [dist1, dist2, dist3, dist4];
minDistance = min(minDist);

end


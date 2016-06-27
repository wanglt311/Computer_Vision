inputImage = imread('white-tower.png');
%imshow(inputImage);
inputImage = im2double(inputImage);
%use initialCentroids to generate 10 random centroids
pickCentroids = randomCentroids(inputImage, 10);
%find features in the image
kmeansOutput = kmeans(inputImage, pickCentroids, 10);
%print the result image
%kmeansOutput = showImage(inputImage, kmeansFeature);
%show image
imshow(kmeansOutput);
figure(1),imshow(inputImage);
figure(2),imshow(kmeansOutput);
imwrite(kmeansOutput, 'kmeansOutout.jpg', 'jpg');
title('kmeansOuput')


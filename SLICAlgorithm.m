function slicOutput = SLICAlgorithm(inputImage)
%SLICALGORITHM Summary of this function goes here
%   Detailed explanation goes here
blockSize = 50;
[height, width, ~] = size(inputImage);
numX = height / blockSize;
numY = width / blockSize;
clusterNum = numX * numY;
cen = zeros(clusterNum, 5);

for i = 1 : numX
    for j = 1 : numY
        position = (i - 1) * numY + j;
        centroids(position, 1) = blockSize * (i - 0.5);
        centroids(position, 2) = blockSize * (j - 0.5);
    end
end

%for each centroid compute the gradient in each of rgb channel .
%move the centroids to the position with the smallest gradient magnitutde
%in 3*3 windows centered on the initial centroids

for i = 1 : clusterNum
    minGradient = 40000;
      for p = -1 : 1
          for q = -1 : 1
              positionX = centroids(i, 1) + p;
              positionY = centroids(i, 2) + q;
              gradient1 = sobelFilter(inputImage(positionX-2:positionX+2, positionY-2:positionY+2, 1));
              gradient2 = sobelFilter(inputImage(positionX-2:positionX+2, positionY-2:positionY+2, 2));
              gradient3 = sobelFilter(inputImage(positionX-2:positionX+2, positionY-2:positionY+2, 3));
              combinedGradient = sqrt(gradient1^2 + gradient2^2 + gradient3*2);
              %gradient = sobelFilter(inputImage(positionX, positionY));
              
              if(combinedGradient < minGradient)
                  minGradient = combinedGradient;
                  centroidX = positionX;
                  centroidY = positionY;
              end
          end
      end
            
    centroids(i, 1) = centroidX;
    centroids(i, 2) = centroidY;
    centroids(i, 3) = inputImage(centroidX, centroidY, 1);
    centroids(i, 4) = inputImage(centroidX, centroidY, 2);
    centroids(i, 5) = inputImage(centroidX, centroidY, 3);
end

%slicOutput = kmeansForSLIC(inputImage, centroids, clusterNum);
slicfeature = doubleBlockKmeans(inputImage, centroids, clusterNum, blockSize*2);
slicOutput = showSLIC(inputImage, slicfeature, centroids, clusterNum);



function saveCentroids = randomCentroids(inputdata, clusterNum)
%RANDOMCENTROIDS Summary of this function goes here
%   Detailed explanation goes here
%[M,N] = size(inputdata);
%saveCentroids = zeros(inputdata);
%C = round(rand(M,N) * 10);
%index = randint(clusterNum, 1, M*N);
%temp = C(index);
[height, width, ~] = size(inputdata);
centroid_x = fix(rand(clusterNum, 1) * (height - 1) + 1);
centroid_y = fix(rand(clusterNum, 1) * (width - 1) + 1);

saveCentroids = [centroid_x centroid_y];
saveCentroids = [saveCentroids zeros(clusterNum, 3)];
%for i = 1 : num
%    saveCentriods(centroid_x(i), centroid_y(i)) = 1;
for i = 1 : clusterNum
    saveCentroids(i, 3) = inputdata(saveCentroids(i, 1), saveCentroids(i, 2), 1);
    saveCentroids(i, 4) = inputdata(saveCentroids(i, 1), saveCentroids(i, 2), 2);
    saveCentroids(i, 5) = inputdata(saveCentroids(i, 1), saveCentroids(i, 2), 3);
end


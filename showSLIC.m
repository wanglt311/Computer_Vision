function inputImage = showSLIC(inputImage, feature, centroids, clusterNum)
%SHOWSLIC Summary of this function goes here
%   Detailed explanation goes here
[height, width, ~] = size(inputImage);
for i = 2 : height - 1
    for j = 2 : width - 1
        for k = 1 : clusterNum
            if(feature(i, j) == k)
                inputImage(i, j, 1:3) = centroids(k, 3:5);
            end
        end
        if(feature(i, j) ~= feature(i+1, j))
            inputImage(i, j, 1:3) = 0;
        end
        if(feature(i, j) ~= feature(i, j+1))
            inputImage(i, j, 1:3) = 0;
        end
    end
end


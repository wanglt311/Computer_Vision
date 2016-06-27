function output = kmeans(inputImage, centroids, clusterNum)
%KMEANS Summary of this function goes here
%   Detailed explanation goes here
%inputImage = im2double(inputImage);
[height, width, ~] = size(inputImage);
%inputdata = inputImage;
feature = zeros(height, width);
%cen = zeros(kCentroids[ ,5]);
output = inputImage;

maxCircle = 100;
circles = 0;

while circles < maxCircle
    rep = 0;
    for i = 1 : height
        for j = 1 : width
            minDis = 100;
            for k = 1 : clusterNum
                dis = sqrt((inputImage(i,j,1) - centroids(k,3)) ^2 + ...
                           (inputImage(i,j,2) - centroids(k,4)) ^2 + ...
                           (inputImage(i,j,3) - centroids(k,5)) ^2);
               
                if(minDis > dis)
                    minDis = dis;
                    feature(i,j) = k;
                end
            end
        end
    end

    for k = 1 : clusterNum
        [x, y] = find(feature == k);
        [m, ~] = size(x);
        %to calculate average of rgb
        sum1 = 0;
        sum2 = 0;
        sum3 = 0;
        sum4 = 0;
        sum5 = 0;
        for p = 1 : m
            sum1 = sum1 + x(p);
            sum2 = sum2 + y(p);
            sum3 = sum3 + inputImage(x(p), y(p), 1);
            sum4 = sum4 + inputImage(x(p), y(p), 2);
            sum5 = sum5 + inputImage(x(p), y(p), 3);
        end
        cen(k,:) = [sum1 sum2 sum3 sum4 sum5] / m;
        %to see if the ten picked centroids is the same as the earlier
        %centroids
        %compare the five dimension of the point
        if(sum(centroids(k,:) == cen(k,:)) ~= 5)
            centroids(k,:) = cen(k,:);
            rep = rep + 1;
        end
    end
    if (rep == 0)
        break;
    end
    circles = circles + 1;
end
%disp(centroids);
for i = 2 : height - 1
    for j = 2 : width - 1
        for k = 1 : clusterNum
            if(feature(i, j) == k)
                output(i, j, 1:3) = centroids(k,3:5);
            end
        end
    end
end

%disp(centroids);
%disp(output);




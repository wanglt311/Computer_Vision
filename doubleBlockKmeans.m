function feature = doubleBlockKmeans(inputImage, centroids, clusterNum, blockSize)
%DOUBLEBLOCKKMEANS Summary of this function goes here
%   Detailed explanation goes here
[newx, newy, ~] = size(inputImage);
inputImage = double(inputImage);
feature = zeros(newx, newy);
distance = 100000*ones(newx, newy);
maxCircle = 100;
circles = 0;
%disp(centroids);
while circles < maxCircle
    rep = 0;
    for k = 1 : clusterNum
        up = round(centroids(k, 1) - blockSize);
        if(up < 1)
            up = 1;
        end
        
        down = round(centroids(k, 1) + blockSize);
        if(down > newx)
            down = newx;
        end
        
        left = round(centroids(k, 2) - blockSize);
        if(left < 1)
            left = 1;
        end
        
        right = round(centroids(k, 2) + blockSize);
        if(right > newy)
            right = newy;
        end
        
        for blockx = up : down
            for blocky = left : right
                dis = sqrt(((blockx / 2) - (centroids(k, 1) / 2)) ^ 2 + ((blocky / 2) - (centroids(k, 2) / 2)) ^ 2) + ...
                      sqrt((inputImage(blockx, blocky, 1) - centroids(k, 3)) ^ 2 + ...
                           (inputImage(blockx, blocky, 2) - centroids(k, 4)) ^ 2 + ...
                           (inputImage(blockx, blocky, 3) - centroids(k, 5)) ^ 2);
                if(distance(blockx, blocky) > dis)
                    distance(blockx, blocky) = dis;
                    feature(blockx, blocky) = k;
                end
            end
        end
    end
    
    for k = 1 : clusterNum
        [x, y] = find(feature == k);
        [m, ~] = size(x);
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
        % to see if the centroid is the same as former loop
        if(sum(centroids(k,:) == cen(k,:)) ~= 5)
            centroids(k,:) = cen(k,:);
            rep = rep + 1;
        end
    end
    if rep == 0
        break;
    end
    circles = circles + 1;
end


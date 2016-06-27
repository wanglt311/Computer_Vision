function [skyVisualWords, nonSkyVisualWords] = formVisualWords(feature, clusterNum)
%FORMVISUALWORDS Summary of this function goes here
%   Detailed explanation goes here
[m, n, ~] = size(feature);
skyPixelNum = sum(sum(feature(:,:,4) == 1));
nonSkyPixelNum = sum(sum(feature(:,:,4) == 0));
skyPixels = zeros(skyPixelNum, 5);
nonSkyPixels = zeros(nonSkyPixelNum, 5);

k = 1;
l = 1;
for i = 1:m
    for j = 1:n
         if(feature(i,j,4) == 1)
             skyPixels(k,1) = i;
             skyPixels(k,2) = j;
             skyPixels(k,3) = feature(i,j,1);
             skyPixels(k,4) = feature(i,j,2);
             skyPixels(k,5) = feature(i,j,3);
             k = k + 1;
         else
             nonSkyPixels(l,1) = i;
             nonSkyPixels(l,2) = j;
             nonSkyPixels(l,3) = feature(i,j,1);
             nonSkyPixels(l,4) = feature(i,j,2);
             nonSkyPixels(l,5) = feature(i,j,3);
             l = l + 1; 
         end
    end
end

[indexSky, skyVisualWords] = kmeans(skyPixels, clusterNum, 'EmptyAction', 'singleton');
[indexNonSky, nonSkyVisualWords] = kmeans(nonSkyPixels, clusterNum, 'EmptyAction', 'singleton');
%disp('0');
%disp(indexSky10);
%disp(indexNonSky10);
%disp(skyC);
%disp(nonSkyC);

end


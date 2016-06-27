function output = pixelClassificationResult(inputImageTest, skyVisualWords, nonSkyVisualWords, testNum, clusterNum)
%PIXELCLASSIFICATIONRESULT Summary of this function goes here
%   Detailed explanation goes here
[m, n, ~] = size(inputImageTest);
output = inputImageTest;
inputImageTest2 = inputImageTest;
inputImageTest2(:,:,4) = zeros(256,256);
distanceSky = zeros(1, clusterNum);
distanceNonSky = zeros(1, clusterNum);
for i = 1:m
    for j = 1:n
        for k = 1:clusterNum
            distanceSky(k) = sqrt((inputImageTest2(i,j,1) - skyVisualWords(k,3)) ^ 2 + ...
                                  (inputImageTest2(i,j,2) - skyVisualWords(k,4)) ^ 2 + ...
                                  (inputImageTest2(i,j,3) - skyVisualWords(k,5)) ^ 2 );
            %minDistSky = min(distanceSky);
            distanceNonSky(k) = sqrt((inputImageTest2(i,j,1) - nonSkyVisualWords(k,3)) ^ 2 + ...
                                     (inputImageTest2(i,j,2) - nonSkyVisualWords(k,4)) ^ 2 + ...
                                     (inputImageTest2(i,j,3) - nonSkyVisualWords(k,5)) ^ 2 );  
            %minDistNonSky = min(distanceNonSky);
        end
        minDistSky = min(distanceSky);
        minDistNonSky = min(distanceNonSky);
        if(minDistSky < minDistNonSky)
            inputImageTest2(i,j,4) = 1;   %sky pixels
            output(i,j,1) = 100;
            output(i,j,2) = 10;
            output(i,j,3) = 100;
        else
            inputImageTest2(i,j,4) = 0;   %non_sky pixels
            output(i,j,1:3) = inputImageTest2(i,j,1:3);
        end
        %end
        
    end
end


inputImageTest = uint8(inputImageTest);
subplot(211),imshow(inputImageTest);
title('Origin image');
output = uint8(output);
subplot(212),imshow(output);
str = ['Test image ', num2str(testNum),' output.'];
str2 = ['output',num2str(testNum),'.jpg' ];
title(str);
imwrite(output, str2, 'jpg');


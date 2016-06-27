inputImage2 = imread('wt_slic.png');
%inputImage2 = im2double(inputImage2);
%inputImage2 = double(inputImage2);

slicOutput = SLICAlgorithm(inputImage2);
imshow(slicOutput);
figure(1),imshow(inputImage2);
figure(2),imshow(slicOutput);
imwrite(slicOutput, 'slicOutout.jpg', 'jpg');
title('slicOuput')
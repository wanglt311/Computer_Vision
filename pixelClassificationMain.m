inputImageTrain = imread('sky_train.jpg');
inputImageTrainWhite = imread('sky_train_white2.jpg');
feature = seperateSky(inputImageTrain, inputImageTrainWhite);

clusterNum = 10;
[skyVisualWords, nonSkyVisualWords] = formVisualWords(feature, clusterNum);


figure(1);
inputImageTest1 = imread('sky_test1.jpg');
imshow(inputImageTest1);
inputImageTest1 = double(inputImageTest1);
classification1 = pixelClassificationResult(inputImageTest1, skyVisualWords, nonSkyVisualWords, 1, clusterNum);
hold on;

figure(2);
inputImageTest2 = imread('sky_test2.jpg');
imshow(inputImageTest2);
inputImageTest2 = double(inputImageTest2);
classification2 = pixelClassificationResult(inputImageTest2, skyVisualWords, nonSkyVisualWords, 2, clusterNum);
hold on;

figure(3);
inputImageTest3 = imread('sky_test3.jpg');
imshow(inputImageTest3);
inputImageTest3 = double(inputImageTest3);
classification3 = pixelClassificationResult(inputImageTest3, skyVisualWords, nonSkyVisualWords, 3, clusterNum);
hold on;

figure(4);
inputImageTest4 = imread('sky_test4.jpg');
imshow(inputImageTest4);
inputImageTest4 = double(inputImageTest4);
classification4 = pixelClassificationResult(inputImageTest4, skyVisualWords, nonSkyVisualWords, 4, clusterNum);
hold on;

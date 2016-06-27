function feature = seperateSky(inputImageTrain, inputImageTrainWhite)
%SEPERATESKY Summary of this function goes here
%   Detailed explanation goes here
[height, width, ~] = size(inputImageTrainWhite);
%inputImageTrain = [inputImageTrain zeros([256, 256], 1)];
inputImageTrainWhite(:,:,4) = zeros(256,256);

%disp(inputImageTrainWhite);

for i = 1:height
    for j = 1:width
        if(inputImageTrainWhite(i,j,1) == 255 && inputImageTrainWhite(i,j,2) == 255 && inputImageTrainWhite(i,j,3) == 255)
            inputImageTrainWhite(i,j,4) = 1;
        else
            inputImageTrainWhite(i,j,4) = 0;
        end
    end
end

inputImageTrain(:,:,4) = inputImageTrainWhite(:,:,4);
feature = inputImageTrain;

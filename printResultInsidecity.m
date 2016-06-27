function classifier = printResultInsidecity(inputImageTest, testNum)
%PRINTRESULT Summary of this function goes here
%   Detailed explanation goes here
minDist1 = calculateDistanceForest(inputImageTest);
minDist2 = calculateDistanceCoast(inputImageTest);
minDist3 = calculateDistanceInsidecity(inputImageTest);

minDist = [minDist1, minDist2, minDist3];
classifier = min(minDist);
if(minDist1 == classifier)
    imshow(inputImageTest);
    str = ['Test image ', num2str(testNum),' of class Insidecity has been assigned to class Forest'];
    title(str);
    %fprintf('%d?%d??%d???%d?',month,day,year,days);
end

if(minDist2 == classifier)
    imshow(inputImageTest);
    str = ['Test image ', num2str(testNum),' of class Insidecity has been assigned to class Coast'];
    title(str);
end

if(minDist3 == classifier)
    imshow(inputImageTest);
    str = ['Test image ', num2str(testNum),' of class Insidecity has been assigned to class Insidecity'];
    title(str);
end


%function output = RANSACimp(inputR, inlierNum, distanceThreshold)
%PROBLEM2 Summary of this function goes here
%   Detailed explanation goes here
inputR = imread('NonMaxSuppression.pgm');
input = im2double(inputR);
figure(1), imshow(input);
hold on
[m,n] = size(input);
inputdata=input;
saveResults = zeros(m,n);
inlierNum = 45;
distanceThreshold = 3;
iterTime = 1;
count = 0;
%[row,col] = find(X);

while(iterTime <= 4)
    [row,col] = find(inputdata==1);
    index = size(row,1);
    disp(index);
    while(count <= inlierNum)
    index1 = ceil(rand*index);
    index2 = ceil(rand*index);
    %index1 = randi([1, index],1,1);
    %index2 = randi([1, index],1,1);
    %SampIndex=floor(1+(size(inputdata,1)-1)*rand(2,1));  
    %samp1=inputdata(SampIndex(1),:);     %randomly pick two points
    %samp2=inputdata(SampIndex(2),:);
    x1 = row(index1);%choose random point1
    y1 = col(index1);
    x2 = row(index2);%choose random point1
    y2 = col(index2);
    %y = randi(col, 2, 1);%choose random point2
%     y(1) = -y(1);
%     y(2) = -y(2);

%    if(x1 ~= x2)
        k=(y1 - y2) / (x1 - x2);     
        a=sqrt(1 - 1/(1 + k^2));
        b=sqrt(1 - a^2);

    if (y1 - y2) / (x1 - x2) > 0          
       b=-b; 
    end

    c=-a * x1-b * y1;
    %line=WorkoutLine([samp1;samp2]);%find the line go through the two points 

        disp(count);
        count=0;
        saveResults=zeros(m,n);
        for i = 1: m
            for j = 1: n          
                    if(inputdata(i,j) == 1)
                        currentDistance = abs(a * i +b * j + c);
                        if (currentDistance <= distanceThreshold)
                            saveResults(i,j) = 1;
                            count = count + 1;
                        end
                    end
            end
        end
        
    end
    count=0;
    [y,x]=find(saveResults==1);
    xMax = find(x==max(x),1);
    xMin = find(x==min(x),1);
    plot([x(xMin) x(xMax)],[y(xMin) y(xMax)], 'r');
    drawnow;
    iterTime = iterTime + 1;
    inputdata = inputdata - saveResults;
    saveResults = zeros(m,n);
end
%figure, imshow(output);
%imwrite(output, 'RANSAC.pgm', 'pgm');
%title('RANSAC')



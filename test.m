input = imread('road.png');
inputImage = input;
[m,n] = size(inputImage);

x1 = randi([1, m], 2, 1);%choose random point1
y1 = randi([1, n], 2, 1);%choose random point2
rand_point1 = [x1 y1];

x2 = randi([1, m], 2, 1);%choose random point1
y2 = randi([1, n], 2, 1);%choose random point2
rand_point2 = [x2 y2];

%the line format is: y = ((y2 - y1)  / (x2 - x1)) * (x - x1)+ y1
%y = ((y2 - y1)  / (x2 - x1)) * x + (((y2 - y1)  / (x2 - x1)) * x1 + y1)


if(x1 ~= x2)
    k = (y2 - y1)  / (x2 - x1);
    b = ((y2 - y1)  / (x2 - x1)) * x1 + y1;
end
figure(5), imshow(input);
imwrite(inputImage, 'DrawLineWithTwoPoints.jpg', 'jpg');
title('DrawLineWithTwoPoints');
hold on
plot([x1 y1], [x2 y2], 'b');



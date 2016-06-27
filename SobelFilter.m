function output = SobelFilter(inputG)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes her
input = inputG;
[m,n] = size(input);
Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [1 2 1; 0 0 0; -1 -2 -1];
sobelArea = [];
vertValue = 0;
horiValue = 0;
sobelValue = 0;
output=zeros(m,n);
r = 1;

inputr = zeros(m+2*r+1, n+2*r+1);
inputr(r+1:m+r, r+1:n+r) = input;

inputr(1:r, r+1:n+r)=input(1:r, 1:n);                 %top edge
inputr(1:m+r, n+r+1:n+2*r+1)=inputr(1:m+r, n:n+r);    %right edge
inputr(m+r+1:m+2*r+1, r+1:n+2*r+1)=inputr(m:m+r, r+1:n+2*r+1);    %bottom edge
inputr(1:m+2*r+1, 1:r)=inputr(1:m+2*r+1, r+1:2*r);    %left edge


for i = r+1: r+m
    for j = r+1: r+n
        sobelArea = inputr(i-r: i+r, j-r: j+r);
        %sobelArea = [inputr(i-1, j-1) inputr(i-1, j) inputr(i-1, j+1); 
        %             inputr(i, j-1) inputr(i, j) inputr(i, j+1); 
        %             inputr(i+1, j-1) inputr(i+1, j) inputr(i+1, j+1)];
        horiValue = sum(sum(sobelArea .* Mx));
        vertValue = sum(sum(sobelArea .* My));
        output(i-r,j-r) = sqrt((vertValue * vertValue) + (horiValue * horiValue));
    end
end
figure, imshow(output(1:m, 1:n));
imwrite(output, 'sobelOutput.pgm', 'pgm');
title('Sobel Filter')


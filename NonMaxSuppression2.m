function output = NonMaxSuppression2(inputS)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
input = inputS;
[m,n] = size(input);

% sobelValue = 0;
% sobelThreshold = 0.1;
r = 1;
output=zeros(m+2,n+2);
%Mx = [-1 0 1; -2 0 2; -1 0 1];
%My = [1 2 1; 0 0 0; -1 -2 -1];

inputr = zeros(m+2*r, n+2*r);
inputr(r+1:m+r, r+1:n+r) = input;

inputr(1:r, r+1:n+r)=input(1:r, 1:n);                 %top edge
inputr(1:m+r, n+r+1:n+2*r+1)=inputr(1:m+r, n:n+r);    %right edge
inputr(m+r+1:m+2*r+1, r+1:n+2*r+1)=inputr(m:m+r, r+1:n+2*r+1);    %bottom edge
inputr(1:m+2*r+1, 1:r)=inputr(1:m+2*r+1, r+1:2*r);    %left edge

for i = r+1: r+m
    for j = r+1: r+n
        %sobelArea = inputr(i-r: i+r, j-r: j+r);
        filter = [inputr(i-1, j-1) inputr(i-1, j) inputr(i-1, j+1); 
                     inputr(i, j-1) inputr(i, j) inputr(i, j+1); 
                     inputr(i+1, j-1) inputr(i+1, j) inputr(i+1, j+1)];
        [p,q] = find(filter== max(max(filter)));
        if(size(p,1)==1 && p == 2 && q == 2)
            output(i,j) = inputr(i,j);
        end
        %output(i-r, j-r) = inputr(i-r, j-r);  
    end
end

figure, imshow(output(1+r:m+r, 1+r:n+r));
imwrite(output, 'NonMaxSuppression.pgm', 'pgm');
title('NonMaxSuppression');


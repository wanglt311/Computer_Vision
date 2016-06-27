function output = NonMaxSuppression(inputS)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
input = inputS;
[m,n] = size(input);
r = 1;
Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [1 2 1; 0 0 0; -1 -2 -1];

inputr = zeros(m+2*r+1, n+2*r+1);
inputr(r+1:m+r, r+1:n+r) = input;

inputr(1:r, r+1:n+r)=input(1:r, 1:n);                 %top edge
inputr(1:m+r, n+r+1:n+2*r+1)=inputr(1:m+r, n:n+r);    %right edge
inputr(m+r+1:m+2*r+1, r+1:n+2*r+1)=inputr(m:m+r, r+1:n+2*r+1);    %bottom edge
inputr(1:m+2*r+1, 1:r)=inputr(1:m+2*r+1, r+1:2*r);    %left edge
for i = r+1: r+m
    for j = r+1: r+n
        %sobelArea = inputr(i-r: i+r, j-r: j+r);
        %sobelArea = [inputr(i-1, j-1) inputr(i-1, j) inputr(i-1, j+1); 
        %             inputr(i, j-1) inputr(i, j) inputr(i, j+1); 
        %             inputr(i+1, j-1) inputr(i+1, j) inputr(i+1, j+1)];
        tansita = (inputr(i+1, j)-inputr(i, j))/(inputr(i, j+1)-inputr(i, j));
        sita = atan(tansita);
        %horizontal-
        if(sita >= -(pi/8) && sita <= (pi/8))
            if(inputr(i, j) > inputr(i, j-1) && inputr(i, j)> inputr(i, j+1))
                inputr(i, j-1) = 0;
                inputr(i, j+1) = 0;
            end
        end
        %left/
        if(sita >= (-(3*pi)/8) && sita <= (-(pi/8)))
            if(inputr(i, j) > inputr(i-1, j+1) && inputr(i, j)> inputr(i+1, j-1))
                inputr(i-1, j+1) = 0;
                inputr(i+1, j-1) = 0;
            end
        end
        %right\
        if(sita >= pi/8 && sita <= (3*pi/8))
            if(inputr(i, j) > inputr(i-1, j-1) && inputr(i, j)> inputr(i+1, j+1))
                inputr(i-1, j-1) = 0;
                inputr(i+1, j+1) = 0;
            end
        end
        %vertical|
        if((sita >= (-(pi/2)) && sita <= (-(3*pi/8))) || (sita >= (3*pi)/8 && sita <= (pi/2)))
            if(inputr(i, j) > inputr(i-1, j) && inputr(i, j)> inputr(i+1, j))
                inputr(i-1, j) = 0;
                inputr(i+1, j) = 0;
            end
        end
        output(i-r, j-r) = inputr(i-r, j-r);     
    end
end

figure, imshow(output(1:m-r, 1:n-r));
imwrite(output, 'NonMaxSuppression.pgm', 'pgm');
title('NonMaxSuppression');






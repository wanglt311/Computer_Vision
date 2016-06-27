function output = GaussianFilter(input, sigma)
%UNTITLED Summary of this function goes here

filterSize = 6 * sigma - 1;
input = im2double(input);
r = 3 * sigma - 1;
coefficient = 1/(sqrt(2*pi)*sigma);
sizeOfGaussian = ([filterSize, filterSize]-1)/2;
[x, y]=meshgrid(-sizeOfGaussian:sizeOfGaussian,-sizeOfGaussian:sizeOfGaussian);
gaussian_x = coefficient * exp(-(x.*x)/(2*sigma*sigma));
gaussian_y = coefficient * exp(-(y.*y)/(2*sigma*sigma));
sum_x = sum(gaussian_x(:));
sum_y = sum(gaussian_y(:));
gaussian_x  = gaussian_x / sum_x;
gaussian_y  = gaussian_y / sum_y;
gaussian_op = gaussian_x .* gaussian_y;
sum_op = sum(gaussian_op(:));
gaussian_op  = gaussian_op / sum_op;

[m,n] = size(input);
%stretch the size of the picture, add 0 to those pixels
%input = [zeros(m, r) input zeros(m, r)];
%input = [zeros(r, n+2*r); input; zeros(r, n+2*r)];
%stretch the size of the picture, copy values of edge pixels to enlarged
inputn = zeros(m+filterSize, n+filterSize);
inputn(r+1:m+r,r+1:n+r) = input;

inputn(1:r,r+1:n+r) = input(1:r,1:n);
inputn(1:m+r,n+r+1:n+filterSize) = inputn(1:m+r,n:n+r);
inputn(m+r+1:m+filterSize, r+1:n+filterSize) = inputn(m:m+r,r+1:n+filterSize);
inputn(1:m+filterSize,1:r) = inputn(1:m+filterSize, r+1:2*r);

for i = r+1: r+m
    for j = r+1: r+n
        output(i-r, j-r) = sum(sum(inputn(i-r: i+r, j-r: j+r) .* gaussian_op));
    end
end
%figure, imshow(uint8(output(1:m-r, 1:n-r)));
figure, imshow(output(1:m-r, 1:n-r));
imwrite(output, 'gaussianOutput.pgm', 'pgm');
title('Gaussian Filter')


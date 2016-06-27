function detM = HessianDetector4(inputS)
%PROBLEM1 Summary of this function goes here
%   Detailed explanation goes here
input = inputS;
input = im2double(input);
[m,n] = size(input);
%w = 4;
%[x y]=meshgrid(-w:w,-w:w);

r = 1;
Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [1 2 1; 0 0 0; -1 -2 -1];
inputr = zeros(m+2*r+1, n+2*r+1);
inputr(r+1:m+r, r+1:n+r) = input;

inputr(1:r, r+1:n+r)=input(1:r, 1:n);                 %top edge
inputr(1:m+r, n+r+1:n+2*r+1)=inputr(1:m+r, n:n+r);    %right edge
inputr(m+r+1:m+2*r+1, r+1:n+2*r+1)=inputr(m:m+r, r+1:n+2*r+1);    %bottom edge
inputr(1:m+2*r+1, 1:r)=inputr(1:m+2*r+1, r+1:2*r);    %left edge
% Dxx = 1/(2*pi*sigma^4)*(x.^2/sigma^2-1)*exp(-(x.^2+y.^2)/(2*sigma^2));     
% Dyy = 1/(2*pi*sigma^4)*(y.^2/sigma^2-1)*exp(-(x.^2+y.^2)/(2*sigma^2));
% Dxy = 1/(2*pi*sigma^6)*(x.*y)*exp(-(x.^2+y.^2)/(2*sigma^2));
% % Ixx=imfilter(Dxx, input);
% % Iyy=imfilter(Dyy, input);
% % Ixy=imfilter(Dxy, input);
% 
% Ixx=imfilter(input, Dxx, 'conv');
% Iyy=imfilter(input, Dyy, 'conv');
% Ixy=imfilter(input, Dxy, 'conv');
Ix = imfilter(input, Mx);
disp(size(Ix,1));
Ixx = imfilter(Ix, Mx);
Iy = imfilter(input, My);
Iyy = imfilter(Iy, My);
Ixy = imfilter(Ix, My);

detM =Ixx .* Iyy - (Ixy).^2;
detM=abs(detM);
%threshold = max(max(detM)) * 0;
detM(detM<0.05*max(max(detM)))=0;

imwrite(detM/max(max(detM)), 'hessianOutput.pgm', 'pgm');
%title('Hessian Detector')




end




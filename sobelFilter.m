function gradient = sobelFilter(inputdata)
%SOBELFILTER Summary of this function goes here
%   Detailed explanation goes here
[m,n,~] = size(inputdata);
%disp(inputdata);
Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [1 2 1; 0 0 0; -1 -2 -1];
sobelArea = [];
vertValue = 0;
horiValue = 0;
gradient = 0;
Mx = uint8(Mx);
My = uint8(My);

for i = 2 : 4
    for j = 2 : 4
          sobelArea = inputdata(i-1: i+1, j-1: j+1);
          horiValue = sum(sum(sobelArea .* Mx));
          vertValue = sum(sum(sobelArea .* My));
          gradient = sqrt((vertValue * vertValue) + (horiValue * horiValue));
          gradient = double(gradient);
    end
end


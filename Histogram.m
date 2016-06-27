function histogram = Histogram(inputImage, binNum)
%HISTOGRAMFIND Summary of this function goes here
%   Detailed explanation goes here
[m,n,~] = size(inputImage);
rhist = zeros(1, 256);
ghist = zeros(1, 256);
bhist = zeros(1, 256);
%binNum = 8;
rPrint = zeros(1, binNum);
gPrint = zeros(1, binNum);
bPrint = zeros(1, binNum);
length = round(256 / binNum);
%disp('0');
for i = 1:m
    for j = 1:n
        rhist(inputImage(i,j,1)+1) = rhist(inputImage(i,j,1)+1)+1;
    end
end
COUNTr = rhist;
x = zeros(1,256);
for i = 1:256
    x(i) = i - 1;
end

for k = 1:binNum - 1
    for value = (0 + length * (k - 1)) : ((length - 1) + length * (k - 1))
        rPrint(k) = rPrint(k) + sum(sum(COUNTr(x==value)));
    end
end
for value = (0 + length * (binNum - 1)) : 255
    rPrint(binNum) = rPrint(binNum) + sum(sum(COUNTr(x==value)));
end


for i = 1:m
    for j = 1:n
        ghist(inputImage(i,j,2)+1) = ghist(inputImage(i,j,2)+1)+1;
    end
end
COUNTg = ghist;
y = zeros(1,256);
for i = 1:256
    y(i) = i - 1;
end
for k = 1:binNum - 1
    for value = (0 + length * (k - 1)) : ((length - 1) + length * (k - 1))
        gPrint(k) = gPrint(k) + sum(sum(COUNTg(x==value)));
    end
end
for value = (0 + length * (binNum - 1)) : 255
    gPrint(binNum) = gPrint(binNum) + sum(sum(COUNTg(x==value)));
end


for i = 1:m
    for j = 1:n
        bhist(inputImage(i,j,3)+1) = bhist(inputImage(i,j,3)+1)+1;
    end
end
COUNTb = bhist;
z = zeros(1,256);
for i = 1:256
    z(i) = i - 1;
end

for k = 1:binNum - 1
    for value = (0 + length * (k - 1)) : ((length - 1) + length * (k - 1))
        bPrint(k) = bPrint(k) + sum(sum(COUNTb(x==value)));
    end
end
for value = (0 + length * (binNum - 1)) : 255
    bPrint(binNum) = bPrint(binNum) + sum(sum(COUNTb(x==value)));
end

histogram = [reshape(rPrint', 1, binNum),reshape(gPrint', 1, binNum),reshape(bPrint', 1, binNum)];
[rPrint, gPrint, bPrint] = verificationStep(rPrint, gPrint, bPrint);
%disp(sum(histogram));
%disp('0');

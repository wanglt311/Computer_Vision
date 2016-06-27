function [rPrint, gPrint, bPrint] = verificationStep(rPrint, gPrint, bPrint)
%VERIFICATIONSTEP Summary of this function goes here
%   Detailed explanation goes here
R = sum(rPrint);
G = sum(gPrint);
B = sum(bPrint);
if(R == 65536 && G == 65536 && B == 65536)
    disp('Verification succeed!');
else
    disp('Verification failed!');
end


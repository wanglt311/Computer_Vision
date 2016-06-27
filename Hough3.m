%function output = Hough3(inputH)
%HOUGH3 Summary of this function goes here
%   Detailed explanation goes here
input = imread('NonMaxSuppression.pgm');
input = im2double(input);
[m,n] = size(input);
figure(1);
hold on;
imshow(input);
title('image after Hessian');
rho_max=floor(sqrt(m^2+n^2))+1; 
accarray=zeros(rho_max,180);
Theta=(0:pi/180:pi);
for i = 1: m
    for j = 1: n 
        if(input(i, j) == 1)
            for k = 1:180
                rho=(i*cos(Theta(k)))+(j*sin(Theta(k)));
                rho_int=round(rho/2+rho_max/2);
                accarray(rho_int,k)=accarray(rho_int,k)+1;
            end
        end
    end
end
figure(2);
colormap gray;
imagesc(accarray);
title('polar')
xlabel('\theta'), ylabel('\rho');
hold on;

K = 1;
for rho_n = 1: rho_max
    for theta_m = 1: 180
        if accarray(rho_n,theta_m)>=10
            case_accarray_n(K)=rho_n;
            case_accarray_m(K)=theta_m;
            K = K + 1;
        end
    end
end
Image_out=zeros(m,n);
Image_class=zeros(m,n);
for i = 1: m
    for j = 1: n
        if input(i, j)==1
            for k=1:180
                rho=(i*cos(Theta(k)))+(j*sin(Theta(k)));
                rho_int=round(rho/2+rho_max/2);
                for a=1:K-1
                    if rho_int==case_accarray_n(a)&& k==case_accarray_m(a) && k==case_accarray_m(a) && rho_int==case_accarray_n(a)
                        Image_out(i,j)=input(i,j); 
                        Image_class(i,j)=k;
                    end
                end
            end
        end
    end
end
figure(3);
imshow(Image_out);
title('Hough');
hold on;
%end


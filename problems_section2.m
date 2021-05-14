% DIGITAL IMAGE PROCESSING
% PROBLEM SET #1
%
% Oscar M. Castro Campos
% Problem Set #1

% =============================================================

%%
% Problem 2.1
clear all; close all; clc;

image = "img\cameraman.tif";
I = imread(image);
xx = 500; yy = 500;
% Nearest neighbor interpolation
out = myInterp2(I, xx, yy, 'nearest');
% Bilinear interpolation

% Bicubic interpolation

figure,
    subplot(121),imshow(I);title('Original Image'); axis([0,xx,0,yy]);axis on;
    subplot(122),imshow(out);title('After interpolation');  axis([0,xx,0,yy]);axis on;

%%
% Problem 2.2
clear all; close all; clc;

image = "img\billete.tif";
I = imread(image);

showBitPlanes(I);

%%
% Problem 2.3
clear all; close all; clc;

image = "img\lenna.tif";
I = imread(image);

T = [150 255 255];
J = myBinary(I, T);

figure,
    subplot(121),   imshow(I),
                    title('Original Image'); axis on;
    subplot(122),   imshow(J),
                    title('Image with threshold'); axis on;

% figure,
%     subplot(221),   imshow(J),
%                     title('Original Image'); axis on;
%     subplot(222),   imshow(J(:,:,1)),
%                     title('Canal 1'); axis on;
%     subplot(223),   imshow(J(:,:,2)),
%                     title('Canal 2'); axis on;
%     subplot(224),   imshow(J(:,:,3)),
%                     title('Canal 3'); axis on;

%%
% Problem 2.4
clear all; close all; clc;

% Choose the format for the results 

% Test with a matrix
matrix = [ 1  2  3  4  5;
           6  7  8  9 10;
          11 12 13 14 15;
          16 17 18 19 20;
          21 22 23 24 25];
          
% Test with a image
% image = "img\lenna.tif";
% I = imread(image);
% matrix = I(1:5,1:5);

[row, col] = size(matrix);
% Reference point
% Center pixel located at matrix(3,3)
xc = 2; yc = 2;

% -----------------------------------
% Euclidean method
% -----------------------------------
% D(p1, p2) = root((x1-x2)^2+(y1-y2)^2)
euclidean = zeros(row, col);
for i = 1:row
    for j = 1:col
        if (i ~= xc) || (j ~= yc)
            D = sqrt((xc - i)^2+(yc - j)^2);
            euclidean(i,j) = D;
        end
    end
end
disp('Euclidean distance: ');
disp(euclidean)
disp('---------------');

% -----------------------------------
% D4 method
% -----------------------------------
% D(p1, p2) = abs(x1-x2)+abs(y1-y2);
D4 = zeros(row, col);
for i = 1:row
    for j = 1:col
        if (i ~= xc) || (j ~= yc)
            D = abs(xc - i) + abs(yc - j);
            D4(i,j) = D;
        end
    end
end
disp('D4 Distance: ');
disp(D4)
disp('---------------');

% -----------------------------------
% D8 method
% -----------------------------------
% D(p1, p2) = max(abs(x1-x2),abs(y1-y2));
D8 = zeros(row, col);
for i = 1:row
    for j = 1:col
        if (i ~= xc) || (j ~= yc)
            D = max(abs(xc - i), abs(yc - j));
            D8(i,j) = D;
        end
    end
end
disp('D8 Distance: ');
disp(D8);

%%
% Problem 2.5
clear all; close all; clc;

image = "img\lenna.tif";
I = imread(image);

readMyImage(I);

%%
% Problem 2.6
clear all; close all; clc;

image = "img\test_pattern.tif";
I = imread(image);

%out = enhanceMyImage(I, 'myAverage', 21);
out = enhanceMyImage(I, 'myMedian', 21);

figure,
        subplot(1,2,1); imshow(I);title('Original Image');
        subplot(1,2,2); imshow(out);title('Image with median filter');

%%
% Problem 2.7
clear all; close all; clc;

image = "img\x_ray.tif";
I = imread(image);
c = 5;
gamma = 2;

% Get dimensions and channels of 'I' 
[x,y,~]=size(I);

A=[0 -1 0 ; -1 4 -1 ; 0 -1 0];
laplacianKernel = [-1,-1,-1;-1,8,-1;-1,-1,-1]/8;
laplacianImage = imfilter(double(I), laplacianKernel);

figure,
        subplot(1,2,1); imshow(I);title('Original Image');
        subplot(1,2,2); imshow(laplacianImage);title('Image with median filter');
% myPowerLawTransformations(I, 5, 2);
%%
% Problem 2.7
clear all; close all; clc;

format long g;
format compact;

image = "img\x_ray.tif";
I = imread(image);

c = [-1,-4,-1;-1,8,-1;-1,-5,-1]/8;
myPowerLawTransformation(I,c,5);


%%
% Problem 2.8
clear all; close all; clc;

image = "img\billete.tif";
I = imread(image);

myHistEq(I,5);
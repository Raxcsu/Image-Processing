function [laplacianImage, sharpenedImage, magnitudeImage] = myPowerLawTransformation(I,c,gamma)
% 
%
% ---- Oscar Castro, 11 05 2021
% 
% ---------- Example ----------
%
% clear all; close all; clc;
% 
% image = "img\test_pattern.tif";
% I = imread(image);
% 
% format long g;
% format compact;
% 
% image = "img\x_ray.tif";
% I = imread(image);
% 
% c = [-1,-4,-1;-1,8,-1;-1,-5,-1]/8;
% myPowerLawTransformation(I,c,5);   

% ===================================================================== %

% Get the dimensions of the image.  
% numberOfColorBands should be = 1.
[~, ~, chan] = size(I);

if (chan ~= 1)
    temp = rgb2gray(I);
else
    temp = I;
end

% Compute Laplacian
laplacianKernel = c;
laplacianImage = imfilter(double(temp), laplacianKernel);

% Compute the sharpened image 
sharpenedImage = double(temp) + laplacianImage;

% Computer Sobel image
[magnitudeImage, ~] = imgradient(temp, 'Sobel');

figure,
        subplot(2,2,1); imshow(temp);title('Original Image');
        subplot(2,2,2); imshow(laplacianImage, []);title('Laplacian');
        subplot(2,2,3); imshow(sharpenedImage, []);title('Sharpened');
        subplot(2,2,4); imshow(magnitudeImage, []);title('Sobel gradient');

end
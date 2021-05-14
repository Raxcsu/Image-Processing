function [out] = readMyImage(I)
% 
% This function is able to read an image and automatically detect
% if the image is in color or grayscale. If the image is in color,
% the output will be same version but in grayscale. if the image is
% in grayscale, the output is the same image.
%
% ---- Oscar Castro, 10 05 2021
% 
% ---------- Example ----------
%
% clear all; close all; clc;
% 
% image = "img\lenna.tif";
% I = imread(image);
% 
% readMyImage(I);

% ===================================================================== %

% Get channels of 'I' 
[~,~,chan]=size(I);

% Detect if 'I' is in color and automatically transform it in grayscale
if (chan == 3)
    out = rgb2gray(I);
    disp('I is coloured');
elseif (chan == 1)
    out = I;
    disp('I is in grayscale');
end

figure,
        subplot(1,2,1); imshow(I);title('Original Image');
        subplot(1,2,2); imshow(uint8(out));title('readMyImage');

end
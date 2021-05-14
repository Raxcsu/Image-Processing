function [bit_plane] = showBitPlanes(I)
% 
% This function displays the original image I in grayscale and 8 images,
% where each one represents each 'bit plane' of the input image.
% 
% % ---- Oscar Castro, 10 05 2021
%
% ---------- Example ----------
%
% image = "img\billete.tif";
% I = imread(image);
% 
% showBitPlanes(I);

% ===================================================================== %

% Gets dimensions of the input image
[row,col,chan]=size(I);

% Verifies that the input image is in grayscale. If not, it transforms 
if chan > 1, I = rgb2gray(I); end
A = double(I);

% Creates an array of zeros with the dimensions of the input image 
bit_plane = zeros(row, col, class(A));

for k = 1:8
    % The 8 bit planes are obtained starting from the least
    % to the most significant bit
    % The function 'floor' allows to obtain the approximate value
    % to the nearest smallest integer. In this way, if the number 
    % has a bit in the least significant position, it can be found
    % using the floor function of the number divided by 2 and
    % then multiplied by 2. 
    
    R = A - floor(A/2)*2;       
    bit_plane(:,:,k) = R;
    A = floor(A/2);
end

% Displays the original grayscale image and the 8 bit planes
figure(1),
    subplot(3,3,1); imshow(I);title('Original Image');
    subplot(3,3,2); imshow(bit_plane(:,:,8));title('8 bit plane');
    subplot(3,3,3); imshow(bit_plane(:,:,7));title('7 bit plane');
    subplot(3,3,4); imshow(bit_plane(:,:,6));title('6 bit plane');
    subplot(3,3,5); imshow(bit_plane(:,:,5));title('5 bit plane');
    subplot(3,3,6); imshow(bit_plane(:,:,4));title('4 bit plane');
    subplot(3,3,7); imshow(bit_plane(:,:,3));title('3 bit plane');
    subplot(3,3,8); imshow(bit_plane(:,:,2));title('2 bit plane');
    subplot(3,3,9); imshow(bit_plane(:,:,1));title('1 bit plane');
end
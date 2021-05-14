function [J] = myBinary(I,T)
% 
% The function binarizes the image with different thresholds,
% one for each channel. 
% Use the fuction myBinary(I,T), where 'I' is the input image
% and 'T' is a 3 point vector with the thresholds for the RGB layers.
% 'T' is a vector of the form [r g b]. You can set a single value to
% 'T', if the image is in grayscale it will take this value as the
% threshold, but if the image is RGB this value will be used for each
% of the thresholds ([r g b]) 
%
% ---- Oscar Castro, 09 05 2021
% 
% ---------- Example ----------
%
% image = "img\lenna.tif";
% I = imread(image);
% 
% T = [150 255 255];
% J = myBinary(I, T);
% 
% figure,
%     subplot(121),   imshow(I),
%                     title('Original Image'); axis on;
%     subplot(122),   imshow(J),
%                     title('Image with threshold'); axis on;     

% ===================================================================== %

% Get dimensions and channels of 'I' 
[row,col,chan]= size(I);

% Gets dimensions of 'T'
[~, ts] = size(T);
% 'T' is a single value and is repeated for the other channels
if (chan == 3 && ts == 1)
    T(2) = T(1); T(3) = T(1);
end

% Creates an array of zeros with the dimensions of the input image 
J = zeros(row, col, class(I));

    % Each pixel of image 'I' is evaluated
    for k = 1:chan
        for i = 1:row
            for j = 1:col
                % If the pixel value is greater than or equal to 'T' on
                % their respective channel, pixel value is set to 255
                if I(i,j,k) >= T(k)
                    J(i,j,k) = 255;
                % but if it's lower, pixel value is set to 0
                else
                    J(i,j,k) = 0;
                end
            end
        end
    end

end
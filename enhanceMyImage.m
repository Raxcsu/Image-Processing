function [out] = enhanceMyImage(I,op,L)
% 
% This function produces an enhanced image. The enhancement can be
% selected by the user between the options ‘average filter’
% [op = 'myAverage'] or ‘median filter’ [op = 'myMedian']
%
% ---- Oscar Castro, 10 05 2021
% 
% ---------- Example ----------
%
% clear all; close all; clc;
% 
% image = "img\test_pattern.tif";
% I = imread(image);
% 
% % Choose one filter --->
% % Average filter
% % out = enhanceMyImage(I, 'myAverage', 21);
% % Median filter
% % out = enhanceMyImage(I, 'myMedian', 21);
% 
% figure,
%         subplot(1,2,1); imshow(I);title('Original Image');
%         subplot(1,2,2); imshow(out);title('Image with filter');     

% ===================================================================== %

% Get dimensions and channels of 'I' 
[x,y,~]=size(I);
% 'a' is the value that is symmetrically added to the image 'I' 
a = (L-1)/2;

% Increase the size of 'I' in relation to the value of 'L' in 'f'
x_zoom = x + L - 1;
y_zoom = y + L - 1;
f = zeros(x_zoom,y_zoom);

% The image 'I' centered in the matrix 'f' is copied 
for i = 1:x
    for j = 1:y
        f(i + a,j + a)=I(i,j);
    end
end

if strcmp(op,'myAverage')
    for i = 1 + a:x_zoom - a
        for j = 1 + a:y_zoom - a
            sum_av = 0;
            for s = -a:a  
                for t = -a:a
                    % Find the sum of the traversed matrix 
                    av = f(i + s,j + t);
                    sum_av = av + sum_av;
                end
            end
            % Get the average value in relation of pixel(i-a,j-a)
            MAF(i - a,j - a) = sum_av/(L^2);
        end
    end
    out  = uint8(MAF);
    
elseif strcmp(op,'myMedian')
    for i = 1 + a:x_zoom - a
        for j = 1 + a:y_zoom - a
            for s = -a:a  
                for t = -a:a
                    med(s+a+1, t+a+1) = f(i+s, j+t); 
                end
            end
            % Get the median value in relation of pixel(i-a,j-a)
            MMF(i-a,j-a) = median(median(med));

        end
    end
    out  = uint8(MMF);
end

end
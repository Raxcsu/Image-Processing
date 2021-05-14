function [out] = myInterp2(I, xx, yy, method)
% 
% This function computes the interpolation method selected by the 
% variable 'method' to the input image 'I.' The inputs 'xx' and
% 'yy' represent the grid for the location of the new pixel values.
% The variable 'method' can be: 'nn' (nearest neighbor, this is the
% default), 'bilinear,' or 'bicubic.'
% 
% ---- Oscar Castro, 10 05 2021
% 
% ---------- Example ----------
% 
% image = "img\cameraman.tif";
% I = imread(image);
% xx = 500; yy = 500;
% % Nearest neighbor interpolation
% out = myInterp2(I, xx, yy, 'nearest');
% % Bilinear interpolation
% 
% % Bicubic interpolation
% 
% figure,
%     subplot(121),imshow(I);title('Original Image'); axis([0,xx,0,yy]);axis on;
%     subplot(122),imshow(out);title('After interpolation');  axis([0,xx,0,yy]);axis on;

[x,y,~]=size(I);

ratio_x = xx/x;
ratio_y = yy/y;

out = zeros(xx, yy, class(I));

if strcmp(method,'nearest')
    for i=1:xx
        for j=1:yy
            % map from output image location to input image location
            ii = round((i-1)*(x-1)/(ratio_x*x-1)+1);
            jj = round((j-1)*(y-1)/(ratio_y*y-1)+1);

            % assign value
            out(i,j) = I(ii,jj);
        end
    end
elseif strcmp(method,'bilinear')
    disp('Bilinear interpolation');
elseif strcmp(method,'bicubic')
    disp('Bicubic interpolation');
else
    for i=1:xx
        for j=1:yy
            % map from output image location to input image location
            ii = round((i-1)*(x-1)/(ratio_x*x-1)+1);
            jj = round((j-1)*(y-1)/(ratio_y*y-1)+1);

            % assign value
            out(i,j) = I(ii,jj);
        end
    end
end
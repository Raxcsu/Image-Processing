function [OUT] = myHistEq(I,L)
% 
% 
%
% ---- Oscar Castro, 11 05 2021
% 
% ---------- Example ----------
%
% image = "img\billete.tif";
% I = imread(image);
% L = 5;
% J = (I, L);
% 
% imshow(I), title('myHistEq');
    

% ===================================================================== %

[x,y,~]=size(I);
OUT = zeros(x,y);

switch nargin
    case 2
        a = (L-1)/2;

        f = zeros(x+(2*a),y+(2*a));
        for i = 1:x
            for j = 1:y
                f(i+a,j+a)=I(i,j);
            end
        end
        
        temp_OUT = [];
        for i = a+1:x+a
            for j = a+1:y+a
                temp_I = zeros(L,L);
                for s = -a:a  
                    for t = -a:a
                        temp_I(s+a+1,t+a+1)=f(i+s,j+t);
                    end
                end
                [~,prob_Hist]=myHist(temp_I);
                Sk = myTransformation(prob_Hist);
          
                temp_OUT(i-a,j-a)=Sk((f(i,j))+1);
            end
        end
        OUT = uint8(temp_OUT);
     
    case 1
        [~,prob]=myHist(I);

        Sk = myTransformation(prob);

        Global_hist=zeros(x,y);

        for ii = 1:x
            for jj = 1:y
                Global_hist(ii,jj)= Sk((I(ii,jj))+1);
            end
        end
        OUT = uint8(Global_hist);
end
end


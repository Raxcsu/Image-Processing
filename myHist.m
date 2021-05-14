function [hist, prob] = myHist(I)

[x,y,~]=size(I);

hist=zeros(1,256);

for i = 1:x
    for j = 1:y
        f = 1;
        k = 0;
        while f==1
            if (I(i,j,1)==k)
                f = 0;
            else
                f=1;
                k = k+1;
            end
    
        end
        hist(k+1)=hist(k+1)+1;
        
    end
end
prob = hist/(x*y);

end


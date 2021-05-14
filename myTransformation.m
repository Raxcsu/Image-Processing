function [Sk] = myTransformation(Pr)

Sk = zeros(1,256);

for a=1:256
    n = 0;
    temp = 0;
    for b=1:a
       n = Pr(b);
       temp = temp + n; 
    end
    Sk(a)= uint8(255*temp);
end

end


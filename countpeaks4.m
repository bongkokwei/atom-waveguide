function countpeaks4
    clc
    x = [-1 0 0 1 2 2 1 2 2 1 3 5 3 7 7 3 6 2 8 8 11 11 1 1 3 4];
    peak = [];
    
    for i = 2 : length(x)
       if i+1 > length(x)
           break
       elseif x(i) >= x(i-1) && x(i) > x(i+1)
           peak = [peak i];
       elseif x(i) == x(i+1) && x(i) >= x(i+2)
           peak = [peak i];
       end
    end
    peak

end

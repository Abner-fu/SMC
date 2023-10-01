function out = sat(s)
    sMax = 10;
    sMin = -10;
    out = s/10;
    if s > sMax
        out = sMax;
    end
    if s < sMin
        out = sMin;
    end  
end
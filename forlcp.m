for i=1:300
    if abs(corl(150,i)-corl(150,150)/e)<0.00001
        lcp=abs(i-150);
        break
    end
end
lcp

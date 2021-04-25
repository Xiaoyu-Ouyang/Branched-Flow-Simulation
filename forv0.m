%计算的是势场的起伏程度v0
i=0;
j=0;
nbar=mean(Ne(:));
sigma=0;
for i=1:2048
    for j=1:3072
        sigma=sigma+Ne(i,j)^4/(2048*3072);
    end
end
v0=0.5*sqrt(sigma/nbar^4-1);


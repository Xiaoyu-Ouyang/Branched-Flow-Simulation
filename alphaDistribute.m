%calculate the distribution of alpha
alpha=zeros(2048,3072);
for i=50:2000
    for j=50:3000
        alpha(i,j)=(sampleD(i-20,j)-sampleD(i+20,j))/(40*pixel);
    end
end

subplot(211),histogram(alpha);
title('Distribution of alpha');

for l=0:3
    hold on;
subplot(212),histogram(l*Td+lambda*ng^2*sqrt(2*abs(alpha))/(ng^2-1)^(3/4));
title('Distribution of d');
end
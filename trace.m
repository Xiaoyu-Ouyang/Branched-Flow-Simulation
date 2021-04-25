%calculate the trace of photon
X=zeros(1200);
Y=zeros(1200);
Vx=zeros(1200);
Vy=zeros(1200);
photo=zeros(2048,3072);

t=0;
p=0;
%initialize
for x=401:1600
    X(x-400)=x;
    Y(x-400)=10;
    Vy(x-400)=1.3;
end

for p=1:1200
    for t=1:6000
        photo(round(X(p)),round(Y(p)))=photo(round(X(p)),round(Y(p)))+0.8;
        photo(round(X(p))+1,round(Y(p)))=photo(round(X(p))+1,round(Y(p)))+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p))-1,round(Y(p)))=photo(round(X(p))-1,round(Y(p)))+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p)),round(Y(p))+1)=photo(round(X(p)),round(Y(p))+1)+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p)),round(Y(p))-1)=photo(round(X(p)),round(Y(p))-1)+(Vx(p)^2+Vy(p)^2);
         photo(round(X(p))+1,round(Y(p))-1)=photo(round(X(p))+1,round(Y(p))-1)+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p))-1,round(Y(p))-1)=photo(round(X(p))-1,round(Y(p))-1)+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p))-1,round(Y(p))+1)=photo(round(X(p)-1),round(Y(p))+1)+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p))-1,round(Y(p))-1)=photo(round(X(p))-1,round(Y(p))-1)+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p))+1,round(Y(p))+1)=photo(round(X(p))+1,round(Y(p))+1)+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p))-1,round(Y(p))+1)=photo(round(X(p))-1,round(Y(p))+1)+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p))+1,round(Y(p))+1)=photo(round(X(p)+1),round(Y(p))+1)+(Vx(p)^2+Vy(p)^2);
        photo(round(X(p))+1,round(Y(p))-1)=photo(round(X(p))+1,round(Y(p))-1)+(Vx(p)^2+Vy(p)^2);
        
        if Y(p)<3052 & Y(p)>5 & X(p)<2028 & X(p)>10 & (Ne(round(X(p)),round(Y(p)))-1)>=0.001
            Y(p)=Y(p)+Vy(p);
            Vy(p)=Vy(p)-(Ve(round(X(p)),round(Y(p))+1)-Ve(round(X(p)),round(Y(p))));
        
            X(p)=X(p)+Vx(p);
            Vx(p)=Vx(p)-(Ve(round(X(p))+1,round(Y(p)))-Ve(round(X(p)),round(Y(p))));
        end
    end
end

for i=1:2048
    for j=1:3072
        if photo(i,j)<=4
            photo(i,j)=0;
        end
    end
end



imagesc(photo,[0,30])
        

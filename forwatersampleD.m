
sample=im2double(sample);
sampleD=3*sample(:,:,1);
i=0;
j=0;
deltaColor=1000;

f = waitbar(0,'1','Name','Thick Map Calculation',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

i=1;
for j=1:3072
        deltaColor=10000;
        
        for d=startD:5:endD
            deltaR=sample(i,j,1)-wBr(10,d);
            deltaG=sample(i,j,2)-wBg(10,d);
            deltaB=sample(i,j,3)-wBb(10,d);
            if (j==1 | abs(d-sampleD(i,j-1))<60) & deltaColor>(abs(deltaR)+abs(deltaG)+abs(deltaB))
                deltaColor=(abs(deltaR)+abs(deltaG)+abs(deltaB));
                sampleD(i,j)=d;
            
            end
        end
end 

j=1;
for i=2:2048
        deltaColor=10000;
        
        for d=startD:5:endD
            deltaR=sample(i,j,1)-wBr(10,d);
            deltaG=sample(i,j,2)-wBg(10,d);
            deltaB=sample(i,j,3)-wBb(10,d);
            if (i==1 | abs(d-sampleD(i-1,j))<60) & deltaColor>(abs(deltaR)+abs(deltaG)+abs(deltaB))
                deltaColor=(abs(deltaR)+abs(deltaG)+abs(deltaB));
                sampleD(i,j)=d;
            end
        end
end  

for i=2:2048
    if getappdata(f,'canceling')
        break
    end
    
    for j=2:3072
        deltaColor=10000;
        
        for d=startD:5:endD
            deltaR=sample(i,j,1)-wBr(10,d);
            deltaG=sample(i,j,2)-wBg(10,d);
            deltaB=sample(i,j,3)-wBb(10,d);
            if ((i==1 | j==500 | j==3072) | (abs(2*d-sampleD(i-1,j)-sampleD(i,j-1))<400)) & deltaColor>(abs(deltaR)+abs(deltaG)+abs(deltaB))
                deltaColor=(abs(deltaR)+abs(deltaG)+abs(deltaB));
                sampleD(i,j)=d;
            
            end
        end
    end    
    rep = 'Calculating....: ';
    a=int2str(round(i/2048*100));
    s=append(rep,a,"%");
    waitbar(i/2048,f,s);
end
sampleD=imfilter(sampleD,h);
imagesc(sampleD,[startD,endD])
delete(f)


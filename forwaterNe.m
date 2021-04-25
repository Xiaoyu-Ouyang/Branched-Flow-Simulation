
lambda =532;
nw = 1.332;
Ne=sampleD;
Ve=sampleD;
ne=1.25;
q=0;

f = waitbar(0,'1','Name','Effective Refractive Index Map Calculation',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

d=0;
for neq=1001:1:1332
    dq(neq)=lambda*(q*pi+2*atan(sqrt((neq/1000)^2-1)/sqrt(nw^2-(neq/1000)^2)))/(sqrt(nw^2-(neq/1000)^2)*2*pi);
end

for i=1:2048
    if getappdata(f,'canceling')
        break
    end
    for j=1:3072
        d=sampleD(i,j);
        for neq=1001:1:1332
            if abs(d-dq(neq))<2.0
                ne=neq/1000;
            end
        end
        Ne(i,j)=ne;
        Ve(i,j)=-0.5*ne^2;
        
    end
    rep = 'Calculating....: ';
    a=int2str(round(i/2048*100));
    s=append(rep,a,"%");
    waitbar(i/2048,f,s);
end
delete(f)

imagesc(Ne,[1.0,1.33])

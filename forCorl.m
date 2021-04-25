%计算折射率分布的相关函数代码

corl=ones(600,600);
i=0;
j=0;
x=1;
y=1;
nbar=mean(Ne(:));%平均折射率
f = waitbar(0,'1','Name','Correlation length Calculation',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

for x=1:300
    if getappdata(f,'canceling')
        break
    end
    for y=1:300
        corl(x,y)=0;
       
            for i=700:1300 %ij用于调节像素值
                for j=1200:1800
                    corl(x,y)=corl(x,y)+(Ne(i,j)-nbar)*(Ne(i-150+x,j-150+y)-nbar)/360000;
            
                end
            end
        
    end
     rep = 'Calculating Hardly....: ';
    a=int2str(round(x/3));
    s=append(rep,a,"%");
    waitbar(x/300,f,s);
end

delete(f)


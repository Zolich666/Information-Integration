function h = ftest2(x,y,alpha,tail)
% 对两个变量方差相等检验
n1=length(x);n2=length(y);
[~,v1]=chi2stat(n1-1);
[~,v2]=chi2stat(n2-1);
ff=v1/v2;
f=finv(1-alpha/2,n1-1,n2-1); %由alpha逆求坐标值
if tail==0
    if ff<=f
        h=0;
    else
        h=1;
    end
end
end


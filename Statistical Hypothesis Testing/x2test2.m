function h = x2test2(x,sigma,alpha,tail)
% 均值未知，方差已知进行卡方假设检验
n=length(x);
[~,v]=chi2stat(n-1);
xx=(n-1)*v/sigma^2;
x1=chi2inv(1-alpha/2,n-1);
x2=chi2inv(alpha/2,n-1); %由alpha逆求坐标值
if tail==0
    if xx>=x1 && xx < x2
        h=0;
    else
        h=1;
    end
end
end


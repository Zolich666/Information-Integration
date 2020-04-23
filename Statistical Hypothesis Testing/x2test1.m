function h = x2test1(x,m,sigma,alpha,tail)
% ��ֵ������֪���п����������
n=length(x);
xx=0;
for i=1:n
    xx=xx+(x(i)-m)^2/sigma^2;
end
x1=chi2inv(1-alpha/2,n-1);
x2=chi2inv(alpha/2,n-1); %��alpha��������ֵ
if tail==0
    if xx>=x1 && xx < x2
        h=0;
    else
        h=1;
    end
end
end


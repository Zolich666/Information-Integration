%例2
n1=9;m1=800;sigma1=40;
x1=780+randn(n1,1); %生成9个均值为780的随机样本
h1=ztest(x1,m1,sigma1);
%例3
n2=25;m2=1000;sigma2=40;alpha2=0.05;tail2=-1;
x2=950+randn(n2,1); %生成25个均值为950的随机样本
h2=ztest(x2,m2,sigma2,alpha2,tail2);
%例4
n3=25;m3=1000;alpha3=0.01;tail3=-1;
x3=950+100.*randn(n3,1); %生成25个均值为950，方差为100的随机样本
h3=ttest(x3,m3,alpha3,tail3);
%例5
m4=1.405;sigma4=0.048;alpha4=0.01;tail4=0;
x4=[1.32;1.55;1.36;1.40;1.44];
h4=x2test1(x4,m4,sigma4,alpha4,tail4);
%例6
alpha5=0.05;tail5=0;
x5a=[24.3;20.3;23.7;21.3;17.4];
x5b=[18.2;16.9;20.2;16.7];
h5=ftest2(x5a,x5b,alpha5,tail5);


%Àý7
x1=[20;15];x2=[32;27];
p1=[20,12;12,8];p2=[20,8;8,12];
a=(x1-x2)'/(p1+p2)*(x1-x2);
chi2=5.991;
if a<=chi2
    h6=0;
else
    h6=1;
end
fprintf(num2str(h6));
    
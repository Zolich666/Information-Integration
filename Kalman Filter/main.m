clc;clear;
T=(1:20);
Z=[1.9945,1.9794,1.9554,1.9214,1.8777,1.8250,1.7598,1.6867,1.6036,1.5092,1.4076,1.2944,1.1724,1.0399,0.8980,0.7455,0.5850,0.4125,0.2318,0.0399];
Z=1000*Z;
Y=1900-10-0.5*9.8*T.^2;
V=10+9.8*T;

X=[10;1900];
Pk_1=[2 0;0 100];
Phi=[1 0;-1 1];
Q=0;
H=[0 1];
R=1000;
u=[9.8;-0.5*9.8];
[Xk(:,1), Pk, Kk] = kalman2(Phi, Q, X, Pk_1, H, R, u, Z(1));
for i=2:20
  [Xk(:,i), Pk, Kk] = kalman2(Phi, Q, Xk(:,i-1), Pk_1, H, R, u, Z(i));
  Pk_1=Pk;
end

figure(1);
plot(T,V,'blue');
hold on;
plot(T,Xk(1,:),'red');
hold on;
legend('true','kalman');
title('velocity');
figure(2);
plot(T,Y,'blue');
hold on;
plot(T,Z,'*');
hold on;
plot(T,Xk(2,:),'red');
hold on;
legend('true','measure','kalman');
title('height');
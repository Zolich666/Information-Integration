function [Xk, Pk, Kk] = kalman2(Phikk_1, Qk, Xk_1, Pk_1, Hk, Rk,uk_1, Zk)
    if nargin<8     % 无量测时一步预报
        Xk = Phikk_1*Xk_1+uk_1;
        Pk = Phikk_1*Pk_1*Phikk_1'+Qk;
    else   
        Xkk_1=Phikk_1*Xk_1+uk_1;    
        Pkk_1 = Phikk_1*Pk_1*Phikk_1' + Qk; 
        Kk = Pkk_1*Hk'/(Hk*Pkk_1*Hk'+Rk);
        Xk = Xkk_1 + Kk*(Zk-Hk*Xkk_1);
        Pk = Pkk_1 - Kk*Hk*Pkk_1;
    end

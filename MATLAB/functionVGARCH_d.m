function [VGARCH_d]=functionVGARCH_d(para_d)
load midas;
%para(1)=w,(2)=alpha,(3)=beta,4=mu,5=gamma

T=numel(DailyReturn);
rdaily(1:T-1)=DailyReturn(2:T);

VGARCH_dd(1,1)=0; %garch
VGARCH_dd(1,2)=0; %squared residual
for t=2:T-1
    VGARCH_dd(t,2)=(rdaily(t)-para_d(4)-para_d(5)*VGARCH_dd(t-1,1))^2;
    VGARCH_dd(t,1)=para_d(1)+para_d(2)*VGARCH_dd(t,2)+para_d(3)*VGARCH_dd(t-1,1);
end

for k=1:882
    VGARCH_d(k,1)=sum(VGARCH_dd((k-1)*22+1:k*22,1));
end
for k=1:882
    VGARCH_d(k,2)=sum(VGARCH_dd((k-1)*22+1:k*22,2));
end


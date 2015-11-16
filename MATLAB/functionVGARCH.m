function [VGARCH]=functionVGARCH(para)
load midas;
%para(1)=w,(2)=alpha,(3)=beta,4=mu,5=gamma

number=length(MonthlyReturn);
rmonthly(1:number-1)=MonthlyReturn(2:number);

VGARCH(1,1)=0; %garch
VGARCH(1,2)=0; %squared residual
for t=2:number-1
    VGARCH(t,2)=(rmonthly(t)-para(4)-para(5)*VGARCH(t-1,1))^2;
    VGARCH(t,1)=para(1)+para(2)*VGARCH(t,2)+para(3)*VGARCH(t-1,1);
end
%
%
%Log likelihood maximum for GARCH
%
function ll_g=loglikelihood_garch(para)
load midas;
number=length(MonthlyReturn);

VGARCH=functionVGARCH(para);
ll_g=(sum(log(VGARCH(2:number-1,1)))+ sum(VGARCH(2:number-1,2)./VGARCH(2:number-1,1)))/2;


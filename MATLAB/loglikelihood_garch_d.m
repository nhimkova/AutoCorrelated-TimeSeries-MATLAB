
%Log likelihood maximum for GARCH daily
%
function ll_g_d=loglikelihood_garch_d(para_d)
load midas;
number=length(MonthlyReturn);

VGARCH_d=functionVGARCH_d(para_d);
ll_g_d=sum(log(VGARCH_d(2:number,1))+ VGARCH_d(2:number,2)./VGARCH_d(2:number,1))/2;
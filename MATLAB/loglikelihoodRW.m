%
%
%Log likelihood maximum for rolling window 1month
%
function ll=loglikelihoodRW(para_rw)
horizon=1;
load midas;

T=length(Vrw1m);
VRW=Vrw1m(1:T-1);
number=length(MonthlyReturn);
Rmonthly(1:T-1) =MonthlyReturn(number-T+2:number);
ll=T/2*log(2*pi)+1/2*sum(log(VRW))+1/2*sum((Rmonthly-para_rw(1)-para_rw(2).*VRW).^2./VRW);
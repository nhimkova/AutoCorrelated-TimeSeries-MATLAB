%
%
%Log likelihood maximum for rolling window 2month
%
function ll=loglikelihoodRW3(para_rw)
horizon=1;
load midas;
T=length(Vrw3m);
VRW=Vrw2m(1:T-2);
number=length(MonthlyReturn);
Rmonthly(1:T-2) =MonthlyReturn(number-T+3:number);
ll=T/2*log(2*pi)+1/2*sum(log(VRW))+1/2*sum((Rmonthly-para_rw(1)-para_rw(2).*VRW).^2./VRW);
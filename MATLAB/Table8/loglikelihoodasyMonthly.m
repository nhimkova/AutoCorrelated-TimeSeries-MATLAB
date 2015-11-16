%
%
%Log likelihood maximum for asyMIDAS
%Monthly
function ll=loglikelihoodasyMonthly(kappa)
load midas;
Vmidas=functionasymidasMonthly(kappa)';
length=22;
N=fix((23031-252+1)/length);
ll=N/2*log(2*pi)+1/2*sum(log(Vmidas))+1/2*sum((MonthlyReturn(fix(252/length)+1:N+fix(251/length))-kappa(3)-kappa(4).*Vmidas).^2./Vmidas);
%
%
%Log likelihood maximum for MIDAS
%Monthly
function ll=loglikelihoodasyMonthly(kappa)
global DailyReturn;
global MonthlyReturn;
num=numel(DailyReturn);
Vmidas=functionasymidasMonthly(kappa)';
length=22;
N=fix((num-251)/length);
ll=N/2*log(2*pi)+1/2*sum(log(Vmidas(1:N-2)))+1/2*sum((max(0,MonthlyReturn(fix(252/length)+2:N+fix(251/length)))-kappa(3)-kappa(4).*Vmidas(1:N-1)).^2./Vmidas(1:N-1));
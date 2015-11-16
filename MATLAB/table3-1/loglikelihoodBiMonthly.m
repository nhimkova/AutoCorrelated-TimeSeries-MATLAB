%
%
%Log likelihood maximum for MIDAS
%BiMonthly
function ll=loglikelihoodBiMonthly(kappa)
global DailyReturn;
global BiMonthlyReturn;

num=numel(DailyReturn);
Vmidas=functionmidasBiMonthly(kappa)';
length=44;
N=fix((num-251)/length)-1;
ll=N/2*log(2*pi)+1/2*sum(log(Vmidas(1:end-2)))+1/2*sum((max(0,BiMonthlyReturn(fix(252/length)+2:N+fix(251/length)+1))-kappa(3)-kappa(4).*Vmidas(1:end-1)).^2./Vmidas(1:end-1));
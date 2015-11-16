%
%
%Log likelihood maximum for MIDAS
%Quarterly
function ll=loglikelihoodQuarterly(kappa)
global DailyReturn;
global QuarterlyReturn;
num=numel(DailyReturn);
Vmidas=functionmidasQuarterly(kappa)';
length=66;
N=fix((num-251)/length)-1;
ll=N/2*log(2*pi)+1/2*sum(log(Vmidas(1:end-1)))+1/2*sum((max(0,QuarterlyReturn(fix(252/length)+2:N+fix(251/length)+1))-kappa(3)-kappa(4).*Vmidas(1:end-1)).^2./Vmidas(1:end-1));
%
%
%Log likelihood maximum for MIDAS
%Daily
function ll=loglikelihoodDaily(kappa)
global DailyReturn;

num=numel(DailyReturn);
Vmidas=functionmidasDaily(kappa)';
length=1;
N=fix((num-251)/length);
ll=N/2*log(2*pi)+1/2*sum(log(Vmidas))+1/2*sum((DailyReturn(fix(252/length):N+fix(251/length))-kappa(3)-kappa(4).*Vmidas).^2./Vmidas);
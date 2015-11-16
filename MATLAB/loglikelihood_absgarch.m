%
%
%Log likelihood maximum for ABSGARCH
%
function ll_absg=loglikelihood_absgarch(paraabs)
load midas;

ABSGARCH=functionABSGARCH(paraabs);
number=length(MonthlyReturn);

ll_absg=0.5*(sum(log(ABSGARCH(2:number,1)))+ sum(power(ABSGARCH(2:number,2),2)./ABSGARCH(2:number,1)));
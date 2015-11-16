%loglikelihood
function [ll_m]=loglikelihood_m(kappa_m)

load midas;

number=length(MonthlyReturn);
Rmonthly =MonthlyReturn(13:number);
Vmidas_m=functionmidas_m(kappa_m);


ll_m=(number-12)/2*log(2*pi)+1/2*sum(log(Vmidas_m(1:number-12)))+1/2*sum((max(Rmonthly,0)'-kappa_m(3)-kappa_m(4).*Vmidas_m(1:number-12)).^2./Vmidas_m(1:number-12));

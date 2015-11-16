%
%
%Log likelihood maximum for MIDAS second subsample
%
function [ll,Vmidas,weight]=loglikelihood2(kappa)
load midas;

%weights
lags=252;
denominator=0;
for i=0:lags-1;
    denominator=denominator+exp(kappa(1)*i+kappa(2)*i^2);
end
for i=0:lags-1;
    weight(lags-i)=exp(kappa(1)*i+kappa(2)*i^2)/denominator;
end

%MIDAS
number=length(MonthlyReturn2);

for i=1:number-12;
        Vmidas(i)=22*weight*(DailyReturn2((i-1)*22+1:(i-1)*22+252).^2);
end

%loglikelihood
Rmonthly =MonthlyReturn2(14:number);

ll=(number-12)/2*log(2*pi)+1/2*sum(log(Vmidas(1:number-13)))+1/2*sum((Rmonthly'-kappa(3)-kappa(4).*Vmidas(1:number-13)).^2./Vmidas(1:number-13));


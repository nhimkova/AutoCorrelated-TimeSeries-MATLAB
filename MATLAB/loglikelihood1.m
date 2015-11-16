%
%
%Log likelihood maximum for MIDAS first subsample
%
function [ll,Vmidas,weight]=loglikelihood1(kappa)
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
number=length(MonthlyReturn1);

for i=1:number-12;
        Vmidas(i)=22*weight*(DailyReturn1((i-1)*22+1:(i-1)*22+252).^2);
end

%loglikelihood
Rmonthly =MonthlyReturn1(14:number);

ll=(number-12)/2*log(2*pi)+1/2*sum(log(Vmidas(1:number-13)))+1/2*sum((max(Rmonthly,0)'-kappa(3)-kappa(4).*Vmidas(1:number-13)).^2./Vmidas(1:number-13));


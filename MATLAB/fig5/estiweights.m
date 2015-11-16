%weights for lags
%

function [weight]=estiweights(kappa)
lags=252;
denominator=0;
for i=0:lags-1;
    denominator=denominator+exp(kappa(1)*i+kappa(2)*i^2);
end
for i=0:lags-1;
    weight(lags-i)=exp(kappa(1)*i+kappa(2)*i^2)/denominator;
end


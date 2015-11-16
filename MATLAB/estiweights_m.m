%weights for lags=12
%

function [weight]=estiweights_m(kappa_m)
lags=12;
denominator=0;
for i=0:lags-1;
    denominator=denominator+exp(kappa_m(1)*i+kappa_m(2)*i^2);
end
for i=0:lags-1;
    weight(lags-i)=exp(kappa_m(1)*i+kappa_m(2)*i^2)/denominator;
end


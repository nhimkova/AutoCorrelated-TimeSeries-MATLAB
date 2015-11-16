
%Negative weights for lags
%kappa(5)=kappa1-,    kappa(6)=kappa2-

function [weight]=Nestiweights(kappa)
lags=252;
denominator=0;
for i=0:lags-1;
    denominator=denominator+exp(kappa(5)*i+kappa(6)*i^2);
end
for i=0:lags-1;
    weight(lags-i)=exp(kappa(5)*i+kappa(6)*i^2)/denominator;
end


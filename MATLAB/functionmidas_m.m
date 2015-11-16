function [Vmidas_m]=functionmidas_m(kappa_m) 
load midas;
rmonthly=MonthlyReturn;
number=length(MonthlyReturn);
[w]=estiweights_m(kappa_m);
for i=1:number-12;
        Vmidas_m(i)=w*(rmonthly((i-1)+1:(i-1)+12).^2);
end
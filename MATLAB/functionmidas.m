%
%
%Vmidas
%

function [Vmidas]=functionmidas(kappa) 
load midas;
rdaily=DailyReturn;
number=length(MonthlyReturn);
[w]=estiweights(kappa);
for i=1:number-12;
        Vmidas(i)=22*w*(rdaily((i-1)*22+1:(i-1)*22+252).^2);
end
 
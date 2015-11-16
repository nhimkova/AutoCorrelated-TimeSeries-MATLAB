%
%
%Vasymidas
%Monthly
%kappa(7)is psy
function [V]=functionasymidasMonthly(kappa);
load midas;
length=22;
N=fix((23031-251)/length);
negativew=Nestiweights(kappa);
positivew=estiweights(kappa);
Dc=0;

 for m=1:N; 
 Dc=Dc+length;
for i=Dc:Dc+251;
  
    if DailyReturn(i)<=0
    j(i,1)=1;
    g(i,1)=0;
    elseif DailyReturn(i)>0
        j(i,1)=0;
        g(i,1)=1;
 end
end

    V(m)=length*(kappa(7)*(negativew*(j(Dc:Dc+251).*(DailyReturn(Dc:Dc+251).^2)))+(2-kappa(7))*positivew*(g(Dc:Dc+251).*(DailyReturn(Dc:Dc+251).^2)));
end
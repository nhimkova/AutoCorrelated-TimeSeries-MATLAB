%
%
%Vasymidas
%Monthly
%kappa(7)is psy
function [V]=functionasymidasMonthly(kappa);
global DailyReturn;
num=numel(DailyReturn);
length=22;
N=fix((num-251)/length);
negativew=Nestiweights(kappa);
positivew=estiweights(kappa);
Dc=0;

 for i=1:N; 
 Dc=Dc+length;
    V(i)=length*(kappa(7)*(negativew*(min(DailyReturn(Dc:Dc+251),0).^2))+(2-kappa(7))*positivew*(max(DailyReturn(Dc:Dc+251),0).^2));
end
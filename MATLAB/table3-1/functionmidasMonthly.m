%
%
%Vmidas
%Monthly

function [V]=functionmidasMonthly(kappa);
global DailyReturn;

num=numel(DailyReturn);
length=22;
N=fix((num-251)/length);
w=estiweights(kappa);
Dc=0;
for i=1:N;
    Dc=Dc+length;
        V(i)=length*w*(DailyReturn(Dc:Dc+251).^2);
end
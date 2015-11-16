%
%
%Vmidas
%BiMonthly

function [V]=functionmidasBiMonthly(kappa);
global DailyReturn;

length=44;
num=numel(DailyReturn);
N=fix((num-251)/length);
w=estiweights(kappa);
Dc=0;
for i=1:N;
    Dc=Dc+length;
        V(i)=length*w*(DailyReturn(Dc:Dc+251).^2);
end
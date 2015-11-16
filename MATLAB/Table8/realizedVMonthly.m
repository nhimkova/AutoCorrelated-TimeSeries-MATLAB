%
%Monthly

function [realV]=realizedVMonthly(DailyReturn)
load midas;
DC=0;
length=22;
N=fix((23031-251)/length);
for i=1:N
    
    DC=DC+length;
    realV(i)=DailyReturn(DC-length+1:DC)'*DailyReturn(DC-length+1:DC);
end

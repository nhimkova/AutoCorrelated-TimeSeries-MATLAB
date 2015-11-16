%
%Monthly

function [realV]=realizedVMonthly(DReturn)
global DailyReturn;

DC=0;
length=22;
num=numel(DailyReturn);
M=fix(num/length);
for i=1:M
    
    DC=DC+length;
    realV(i)=DailyReturn(DC-length+1:DC)'*DailyReturn(DC-length+1:DC);
end

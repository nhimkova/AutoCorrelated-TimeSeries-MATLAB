%
%Daily

function [realV]=realizedVDaily(DReturn)
global DailyReturn;

num=numel(DailyReturn);
DC=0;
length=1;
M=fix(num/length);
for i=1:M
    
    DC=DC+length;
    realV(i)=DailyReturn(DC-length+1:DC)'*DailyReturn(DC-length+1:DC);
end

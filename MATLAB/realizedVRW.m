function [realV]=realizedVRW(DailyReturn)
load midas;
DC=0;
for i=1:1043
    
    DC=DC+22;
    realV(i)=DailyReturn(DC-22+1:DC)'*DailyReturn(DC-22+1:DC);
end

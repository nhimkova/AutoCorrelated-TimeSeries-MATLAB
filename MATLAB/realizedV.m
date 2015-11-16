function [realV]=realizedV(DailyReturn)
load midas;
number=length(MonthlyReturn);
for i=1:number
    
    realV(i)=DailyReturn((i-1)*22+1:i*22)'*DailyReturn((i-1)*22+1:i*22);
end

%
%Creating Rolling window 

length=22;
load midas;
DC=0;
for i=1:881;
    
    DC=DC+22;
    Vrw1m(i)=22*sum((1/length)*DailyReturn(DC-length+1:DC)'*DailyReturn(DC-length+1:DC));
end

length=44;
load midas;
DC=22;
for i=1:880;
    
    DC=DC+22;
    Vrw2m(i)=22*sum((1/length)*DailyReturn(DC-length+1:DC)'*DailyReturn(DC-length+1:DC));
end

length=66;
load midas;
DC=44;
for i=1:879;
    
    DC=DC+22;
    Vrw3m(i)=22*sum((1/length)*DailyReturn(DC-length+1:DC)'*DailyReturn(DC-length+1:DC));
end
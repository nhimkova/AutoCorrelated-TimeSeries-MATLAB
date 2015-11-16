function [ABSGARCH]=functionABSGARCH(paraabs)
load midas;
%paraabs(1)=w,(2)=alpha,(3)=beta,4=mu,5=gamma

number=length(MonthlyReturn);
rmonthly(1:number)=MonthlyReturn(1:number);

ABSGARCH(1,1)=0;
ABSGARCH(1,2)=0;
sum=0;
for t=2:number
     ABSGARCH(t,2)=max(0,rmonthly(t))-paraabs(4)+paraabs(5)*ABSGARCH(t-1,1)  ;
     ABSGARCH(t,1)=(paraabs(1)+paraabs(2)*abs(ABSGARCH(t,2))+paraabs(3)*sqrt(ABSGARCH(t-1,1)))^2;
end
   
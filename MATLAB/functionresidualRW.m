function []=functionresidualRW()
load midas;

%monthly variance
RealV=realizedV(DailyReturn);
Vmidas=FunctionRW(kappa)
new(1,:)=ones(1,646);
new(2,:)=Vmidas;
[b,bint,r,rint,stats]=regress(RealV(1,11:600)',new(1,1:590)');
R2R=stats;

 


[kappa]=fminsearch('loglikelihood',[-0.005,-0.0001,0.006,2.6]);
EstiReturn=kappa(3)+kappa(4)*Vmidas;
new1(1,:)=ones(1,600);
new1(2,:)=EstiReturn;
[b,bint,r,rint,stats]=regress(MonthlyReturn(11:600,1),new1(1,1:590)')
R2=stats;

end
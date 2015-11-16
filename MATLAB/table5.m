disp('.')
disp('.')
disp('.')
disp('-------------------------------------------------------------------')
disp('************************* Table 5 GARCH ***************************')
disp('-------------------------------------------------------------------')



%
%
%
%-----------------------------GARCH-----------------------------------------
%
%
%
%
%Maximise likelihood for GARCH
model='GARCH';

[para,y]=fminsearch('loglikelihood_garch',[0.1,0.1,0.1,-0.01,1]);
%para(1)=w,(2)=alpha,(3)=beta,4=mu,5=gamma

stderr_g=stderr_garch(para);
tstats_g=para./stderr_g;

%R square values on realized variance regression

Vgarch=functionVGARCH(para);
number=length(Vgarch);
new=ones(2,number);
new(2,1:number)=Vgarch(1:number);
[b,bint,r,rint,stats]=regress(realV(1:number)',new');
R2S=stats(1);

%R square values on realized variance regression

[b,bint,r,rint,stats]=regress(MonthlyReturn(1:number),new');
R2R=stats(1);

disp(sprintf('Mod     omega      alpha      beta      mu       gamma        R2R      R2S      LLF'))
disp(sprintf('-----------------------------------------------------------------------------------'))
format short;
disp(sprintf('%s  %g  %g  %g  %g  %g  %g  %g  %g', model, para, R2R, R2S, y))
disp(sprintf('      [%g]   [%g]  [%g]  [%g]  [%g] ', tstats_g))

%
%
%
%----------------------------ABSGARCH-----------------------------------------
%
%
%
%
model='ABS-G';
%Maximise likelihood for ABSGARCH
[paraabs,y]=fminsearch('loglikelihood_absgarch',[0.1,0,0,0,0]);
%para(1)=w,(2)=alpha,(3)=beta,4=mu,5=gamma

stderr_a=stderr_absgarch(paraabs);
tstats_a=paraabs./stderr_a;

%R square values on realized variance regression

ABSGARCH=functionABSGARCH(paraabs);
new=ones(2,882);
new(2,1:882)=ABSGARCH(1:882,1);
[b,bint,r,rint,stats]=regress(realV(1:882)',new');
R2S=stats(1);

%R square values on realized variance regression

[b,bint,r,rint,stats]=regress(MonthlyReturn(1:882),new');
R2R=stats(1);
disp(sprintf('%s  %g  %g  %g  %g  %g  %g  %g  %g', model, paraabs, R2R, R2S, y))
disp(sprintf('      [%g]   [%g]  [%g]  [%g]  [%g] ', tstats_a))

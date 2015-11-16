%
%
%Table 8 Sample 1928-2000

disp('--------------------------------------------------------------------------------------------------')
disp('      mu      gama   kappa1-  kappa2-    kappa1+   kappa 2+    psy   R2R      R2        LLF       ')
disp('--------------------------------------------------------------------------------------------------')
disp('Sample:1928:01-2000:12')
disp('Monthly')  

global DailyReturn;
global WeeklyReturn;
global MonthlyReturn;
global BiMonthlyReturn;
global QuarterlyReturn;
load midas;
%Maximising loglikelihood for Rollingwindow
 options = optimset('Algorithm','interior-point','MaxFunEvals',2000,'MaxIter',2000);
[kappa,y]=fminunc('loglikelihoodasyMonthly',[0.5,-0.0002,0.0015,2,0.2,-0.02,0.57],options);

stderr=stderr_midas(kappa);
tstat=kappa./stderr;
%R square values on realized variance regression

[realV]=realizedVMonthly(DailyReturn);
num=numel(DailyReturn);
length=22;
N=fix((num-251)/length);
new=ones(2,N-1);
Vmidas=functionasymidasMonthly(kappa);
new(2,1:N-1)=Vmidas(1:N-1);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+2:N+fix(251/length))',new');
R2S=stats(1);

%R square values on realized variance regression
[b,bint,r,rint,stats]=regress(MonthlyReturn(fix(252/length)+2:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf(' %g   %g   %g    %g    %g     %g    %g   %g   %g     %g ',kappa(3),kappa(4),kappa(5),kappa(6),kappa(1),kappa(2),kappa(7),R2R,R2S,y));
disp(sprintf('[%g]  [%g]  [%g]   [%g]   [%g]  [%g]  [%g]',tstat(3), tstat(4), tstat(5), tstat(6), tstat(1), tstat(2), tstat(7)));


%
% first half
%
disp('Sample:1928:01-1963:12')
clear;
global DailyReturn;
global WeeklyReturn;
global MonthlyReturn;
global BiMonthlyReturn;
global QuarterlyReturn;
load midas1;
options = optimset('Algorithm','interior-point','MaxFunEvals',2000,'MaxIter',2000);
[kappa,y]=fminunc('loglikelihoodasyMonthly',[0.005,-0.003,0.0015,2,0.2,-0.02,0.57],options);
stderr=stderr_midas(kappa);
tstat=kappa./stderr;

%R square values on realized variance regression

[realV]=realizedVMonthly(DailyReturn);
num=numel(DailyReturn);
length=22;
N=fix((num-251)/length);
new=ones(2,N-1);
Vmidas=functionasymidasMonthly(kappa);
new(2,1:N-1)=Vmidas(1:N-1);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+2:N+fix(251/length))',new');
R2S=stats(1);

%R square values on realized variance regression
[b,bint,r,rint,stats]=regress(MonthlyReturn(fix(252/length)+2:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf(' %g   %g   %g    %g    %g     %g    %g   %g   %g     %g ',kappa(3),kappa(4),kappa(5),kappa(6),kappa(1),kappa(2),kappa(7),R2R,R2S,y));
disp(sprintf('[%g]  [%g]  [%g]   [%g]   [%g]  [%g]  [%g]',tstat(3), tstat(4), tstat(5), tstat(6), tstat(1), tstat(2), tstat(7)));

%
% second half
%
%
disp('Sample:1964:01-2000:12')
clear;
global DailyReturn;
global WeeklyReturn;
global MonthlyReturn;
global BiMonthlyReturn;
global QuarterlyReturn;
load midas2;
options = optimset('Algorithm','interior-point','MaxFunEvals',2000,'MaxIter',2000);
[kappa,y]=fminunc('loglikelihoodasyMonthly',[-0.005,-0.005,0.0015,2,0.2,-0.02,0.57],options);
stderr=stderr_midas(kappa);
tstat=kappa./stderr;

%R square values on realized variance regression

[realV]=realizedVMonthly(DailyReturn);
num=numel(DailyReturn);
length=22;
N=fix((num-251)/length);
new=ones(2,N-1);
Vmidas=functionasymidasMonthly(kappa);
new(2,1:N-1)=Vmidas(1:N-1);
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+2:N+fix(251/length))',new');
R2S=stats(1);

%R square values on realized variance regression
[b,bint,r,rint,stats]=regress(MonthlyReturn(fix(252/length)+2:N+fix(251/length)),new');
R2R=stats(1);
disp(sprintf(' %g   %g   %g    %g    %g     %g    %g   %g   %g     %g ',kappa(3),kappa(4),kappa(5),kappa(6),kappa(1),kappa(2),kappa(7),R2R,R2S,y));
disp(sprintf('[%g]  [%g]  [%g]   [%g]   [%g]  [%g]  [%g]',tstat(3), tstat(4), tstat(5), tstat(6), tstat(1), tstat(2), tstat(7)));


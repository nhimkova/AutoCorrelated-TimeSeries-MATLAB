%
%
%Table 4 Sample 1928-2000


disp('.')
disp('.')
disp('.')
disp('----------------------------------------------------')
disp('           *** Table 4 Rolling window ***      ')
disp('----------------------------------------------------')


%Maximising loglikelihood for Rollingwindow

horizon=1;
[para_rw,y]=fminsearch('loglikelihoodRW',[0,0]);    

%R square values on realized variance regression

load midas;
T=numel(Vrw1m);
number=numel(realV);
new=ones(2,T);
new(2,1:T)=Vrw1m(1:T);
[b,bint,r,rint,stats]=regress(realV(number-T+1:number)',new');
statR2S=stats(1);

%R square values on realized variance regression


[b,bint,r,rint,stats]=regress(MonthlyReturn(2:881),new(1:2,1:880)');
statR2R=stats(1);

%t stats
stderr=stderr_rw1(para_rw);
tstats=para_rw./stderr;

disp(sprintf(' Horizon    mu      gamma      R2R      R2s          LLF       '))
disp(sprintf('-----------------------------------------------------------'))
disp(sprintf('%g     %g   %g    %g   %g       %g',horizon,para_rw,statR2R,statR2S, y))
disp(sprintf('    [%g]  [%g]',tstats))

horizon=2;
%Maximising loglikelihood for Rollingwindow horizon 2

[para_rw,y]=fminsearch('loglikelihoodRW2',[0,0]);    

%R square values on realized variance regression

T=numel(Vrw2m);
number=numel(realV);
new=ones(2,T);
new(2,1:T)=Vrw1m(1:T);
[b,bint,r,rint,stats]=regress(realV(number-T+1:number)',new');
statR2S=stats(1);

%R square values on realized variance regression


[b,bint,r,rint,stats]=regress(MonthlyReturn(number-T+1:number),new');
statR2R=stats(1);

%t stats
stderr=stderr_rw2(para_rw);
tstats=para_rw./stderr;

disp(sprintf('%g    %g  %g    %g  %g  %g   %g',horizon,para_rw,statR2R,statR2S, y))
disp(sprintf('    [%g]  [%g]',tstats))


%Maximising loglikelihood for Rollingwindow horizon 3
horizon=3;
[para_rw,y]=fminsearch('loglikelihoodRW3',[0,0]);    

%R square values on realized variance regression

T=numel(Vrw3m);
number=numel(realV);
new=ones(2,T);
new(2,1:T)=Vrw1m(1:T);
[b,bint,r,rint,stats]=regress(realV(number-T+1:number)',new');
statR2S=stats(1);

%R square values on realized variance regression


[b,bint,r,rint,stats]=regress(MonthlyReturn(number-T+1:number),new');
statR2R=stats(1);

%t stats
stderr=stderr_rw3(para_rw);
tstats=para_rw./stderr;

disp(sprintf('%g    %g  %g    %g  %g  %g   %g',horizon,para_rw,statR2R,statR2S, y))
disp(sprintf('    [%g]  [%g]',tstats))
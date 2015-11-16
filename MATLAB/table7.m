% Table 7


disp('.')
disp('.')
disp('.')
disp('-------------------------------------------------------------------')
disp('*************************    Table 7    ***************************')
disp('-------------------------------------------------------------------')


%Garch daily
[para_d,y]=fminsearch('loglikelihood_garch_d',[0.1,0.1,0.1,-0.01,1]);
Vgarch_d=functionVGARCH_d(para_d);

stderr_g_d=stderr_garch_d(para_d);
tstats_g_d=para_d./stderr_g_d;

%R square values on realized variance regression
number=length(Vgarch_d);
new=ones(2,number);
new(2,1:number)=Vgarch_d(1:number);
[b,bint,r,rint,stats]=regress(realV(1:number)',new');
R2S=stats(1);

%R square values on realized variance regression

[b,bint,r,rint,stats]=regress(MonthlyReturn(1:number),new');
R2R=stats(1);

disp('.')
disp('.')
disp(sprintf('  GARCH daily  '))
disp(sprintf('  omega      alpha      beta      mu       gamma        R2R      R2S      LLF'))
disp(sprintf('-----------------------------------------------------------------------------------'))
format short;
disp(sprintf('%g  %g  %g  %g  %g  %g  %g  %g', para_d, R2R, R2S, y))
disp(sprintf('[%g]   [%g]  [%g]  [%g]  [%g] ', tstats_g_d))


%Maximising loglikelihood for MIDAS
[kappa_m,y]=fminsearch('loglikelihood_m',[-0.0003,-0.0001,0.02,1]);
Vmidas_m=functionmidas_m(kappa_m);

stderr_m=stderr_midas_m(kappa_m);
tstat_m=kappa_m./stderr_m;


%R square values on realized variance regression

[realV]=realizedV(DailyReturn);
new=ones(2,869);
new(2,1:869)=Vmidas_m(1:869);
[b,bint,r,rint,stats]=regress(realV(2:870)',new');
R2S=stats(1);

%R square values on realized variance regression

[b,bint,r,rint,stats]=regress(MonthlyReturn(14:882),new');
R2R=stats(1);

disp('.')
disp('.')
disp(sprintf('  MIDAS monthly  '))
disp(sprintf('  kappa1     kappa2       mu        gamma      R2R      R2S      LLF'))
disp(sprintf('---------------------------------------------------------------------'))
format short;
disp(sprintf('  %g  %g  %g  %g  %g  %g  %g', kappa_m, R2R, R2S, y))
disp(sprintf(' [%g]  [%g]  [%g]  [%g] ', tstat_m))

%
disp('.')
disp('.')
disp('.')
disp('-------------------------------------------------------------------')
disp('************************* Table 2 MIDAS ***************************')
disp('-------------------------------------------------------------------')

%------------FULL sample------------
sub=0;

%Maximising loglikelihood for MIDAS
[kappa,y]=fminsearch('loglikelihood',[-0.003,-1,0.005,2]);
Vmidas=functionmidas(kappa);

stderr_m=stderr_midas(kappa);
tstat_m=kappa./stderr_m;


%R square values on realized variance regression

[realV]=realizedV(DailyReturn);
new=ones(2,869);
new(2,1:869)=Vmidas(1:869);
[b,bint,r,rint,stats]=regress(realV(2:870)',new');
R2S=stats(1);

%R square values on realized variance regression

[b,bint,r,rint,stats]=regress(MonthlyReturn(14:882),new');
R2R=stats(1);


disp(sprintf('sub   kappa1     kappa2       mu        gamma      R2R      R2S      LLF'))
disp(sprintf('---------------------------------------------------------------------'))
format short;
disp(sprintf('%g  %g  %g  %g  %g  %g  %g  %g', sub, kappa, R2R, R2S, y))
disp(sprintf('   [%g]  [%g]  [%g]  [%g] ', tstat_m))



%------------Subsample: first half---------------
sub=1;

%Maximising loglikelihood for MIDAS
[kappa,y]=fminsearch('loglikelihood1',[-0.003,-1,0.005,2]);
[ll,Vmidas1,weight]=loglikelihood1(kappa);

stderr_m=stderr_midas(kappa);
tstat_m=kappa./stderr_m;


%R square values on realized variance regression

new=ones(2,428);
new(2,1:428)=Vmidas1(1:428);
[b,bint,r,rint,stats]=regress(realV(14:441)',new');
R2S=stats(1);

%R square values on realized variance regression

[b,bint,r,rint,stats]=regress(MonthlyReturn1(14:441),new');
R2R=stats(1);

format short;
disp(sprintf('%g  %g  %g  %g  %g  %g  %g  %g', sub, kappa, R2R, R2S, y))
disp(sprintf('   [%g]  [%g]  [%g]  [%g] ', tstat_m))

%------------Subsample: second half---------------
sub=2;

%Maximising loglikelihood for MIDAS
[kappa,y]=fminsearch('loglikelihood2',[-0.003,-1,0.005,2]);
[ll,Vmidas2,weight]=loglikelihood2(kappa);

stderr_m=stderr_midas(kappa);
tstat_m=kappa./stderr_m;


%R square values on realized variance regression

new=ones(2,428);
new(2,1:428)=Vmidas2(1:428);
[b,bint,r,rint,stats]=regress(realV(455:882)',new');
R2S=stats(1);

%R square values on realized variance regression

[b,bint,r,rint,stats]=regress(MonthlyReturn2(14:441),new');
R2R=stats(1);

format short;
disp(sprintf('%g  %g  %g  %g  %g  %g  %g  %g', sub, kappa, R2R, R2S, y))
disp(sprintf('    [%g]   [%g]   [%g]   [%g] ', tstat_m))
%
%
%Table 3 Sample 1928-2000

disp('-------------------------------------------------------------------')
disp('      mu      gamma    k1-     k2-    k1+    k2+   psy    LLF       ')
disp('-------------------------------------------------------------------')
disp('Sample:1928:01-20000:12')
disp('Monthly')

%Maximising loglikelihood for Rollingwindow

[kappa,y]=fminsearch('loglikelihoodasyMonthly',[-0.005,-1,0.001,4,0.2,0.012,0.572]);
disp(sprintf('    %g      %g    %g      %g       %g     %g        %g      %g   ',kappa(3),kappa(4),kappa(5),kappa(6),kappa(1),kappa(2),kappa(7),y))
    


%R square values on realized variance regression



disp('REGRESSION ON REALIZED VARIANCE')
disp('----------------------------------------------------')

load midas;
[realV]=realizedVMonthly(DailyReturn);
length=22;
N=fix((23031-251)/length);
new=ones(2,N-fix(252/length));
Vmidas=functionasymidasMonthly(kappa);
new(2,1:N-fix(252/length))=Vmidas(1:N-fix(252/length));
[b,bint,r,rint,stats]=regress(realV(fix(252/length)+1:N)',new');
disp(sprintf('Coefficients: Constant=%g, Beta=%g', b))
disp(sprintf('Statistics: R square=%g, F stat=%g, p=%g , error var=%g',stats))

%R square values on realized variance regression


disp('.')
disp('.')
disp('.')
disp('REGRESSION ON MONTHLY RETURN')
disp('----------------------------------------------------')

[b,bint,r,rint,stats]=regress(MonthlyReturn(fix(252/length)+1:N),new');
disp(sprintf('Coefficients: Constant=%g, Beta=%g', b))
disp(sprintf('Statistics: R square=%g, F stat=%g, p=%g , error var=%g',stats))
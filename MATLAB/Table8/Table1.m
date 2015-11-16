
%Table 1
%Summary statistics of returns and realized variance
load midas;
M_=mean(MonthlyReturn);
V_=var(MonthlyReturn);
S_=skewness(MonthlyReturn);
K_=kurtosis(MonthlyReturn);
AR=autocorr(MonthlyReturn);
AR1=AR(2);
AR12=sum(AR(1:12));
disp('Table 1');
disp('Mean  Variance  Skewness  Kurtosis ');

disp('-----------------------------------');
disp(sprintf('%g  %g  %g  %g  %g  %g',M_,V_,S_,K_,AR1,AR12));


%Table 2

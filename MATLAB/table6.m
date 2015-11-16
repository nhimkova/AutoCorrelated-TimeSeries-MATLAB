%Table 6 Comparison of models: MIDAS, GARCH, Rolling window

disp('.')
disp('.')
disp('.')
disp('-------------------------------------------------------------------')
disp('*****************  Table 6 Comparison of models  ******************')
disp('-------------------------------------------------------------------')

load midas;

%Panel A

%Create MIDAS
[ll,Vmidas,weight]=loglikelihood(kappa);

%Create GARCH
[VGARCH]=functionVGARCH(para);

%Rolling window already created, Vrw1m
[para_rw,y]=fminsearch('loglikelihoodRW',[1,1]);

%Statistics
m_m=mean(Vmidas);
m_g=mean(VGARCH(1:881,1));
m_r=mean(Vrw1m);
v_m=var(Vmidas);
v_g=var(VGARCH(1:881,1));
v_r=var(Vrw1m);

acf_m=autocorr(Vmidas,13);
autocorr_m1=acf_m(2);
autocorr_m12=acf_m(13);

acf_g=autocorr(VGARCH(1:881,1),13);
autocorr_g1=acf_g(2);
autocorr_g12=acf_g(13);

acf_r=autocorr(Vrw1m,13);
autocorr_r1=acf_r(2);
autocorr_r12=acf_r(13);


disp('.')
disp('.')
disp(sprintf('PANEL A: Summary statistics'))
disp(sprintf('---------------------------------------------------------------------'))
disp(sprintf('          Mean        Variance       AR(1)         AR(12)    '))
disp(sprintf('---------------------------------------------------------------------'))
disp(sprintf('MIDAS   %g    %g      %g     %g',m_m,v_m,autocorr_m1,autocorr_m12))
disp(sprintf('GARCH   %g    %g      %g     %g',m_g,v_g,autocorr_g1,autocorr_g12))
disp(sprintf('RW      %g    %g      %g     %g',m_r,v_r,autocorr_r1,autocorr_r12))


E_midas=(MonthlyReturn(13:882)'-kappa(3)-kappa(4)*Vmidas(1:870))./sqrt(Vmidas(1:870));
E_garch=(MonthlyReturn(4:882)-para(4)-para(5)*VGARCH(2:880,1))./sqrt(VGARCH(2:880,1));
E_rw=(MonthlyReturn(3:882)'-para_rw(1)-para_rw(2)*Vrw1m(1:880))./sqrt(Vrw1m(1:880));

var_em=var(E_midas);
var_eg=var(E_garch);
var_er=var(E_rw);

skew_em=skewness(E_midas);
skew_eg=skewness(E_garch);
skew_er=skewness(E_rw);

kurt_em=kurtosis(E_midas);
kurt_eg=kurtosis(E_garch);
kurt_er=kurtosis(E_rw);

%Goodness of fit
new1=ones(870,2);
new1(1:870,2)=Vmidas(1:870);

[b,bint,r,rint,stats]=regress(realV(13:882)',new1);
goodness_m=stats(1);

new2=ones(880,2);
new2(1:880,2)=VGARCH(1:880);
[b,bint,r,rint,stats]=regress(realV(3:882)',new2);
goodness_g=stats(1);

new2=ones(880,2);
new2(1:880,2)=Vrw1m(1:880);
[b,bint,r,rint,stats]=regress(realV(3:882)',new2);
goodness_r=stats(1);


disp('.')
disp('.')
disp(sprintf('PANEL B: Performance of cond var models'))
disp(sprintf('---------------------------------------------------------------------'))
disp(sprintf('        Var E       Skewness E      Kurt E         Goodness of fit    '))
disp(sprintf('---------------------------------------------------------------------'))
disp(sprintf('MIDAS   %g     %g      %g     %g',var_em,skew_em,kurt_em,goodness_m))
disp(sprintf('GARCH   %g    %g       %g     %g',var_eg,skew_eg,kurt_eg,goodness_g))
disp(sprintf('RW      %g    %g      %g     %g',var_er,skew_er,kurt_er,goodness_r))


matrix_models=zeros(870,4);
matrix_models(1:870,1)=Vmidas(1:870);
matrix_models(2:871,2)=VGARCH(12:881,1);
matrix_models(3:872,3)=Vrw1m(12:881);
matrix_models(2:871,4)=realV(13:882);

r=corr(matrix_models);

disp('.')
disp('.')
disp(sprintf('PANEL C: Correlation matrix'))
disp(sprintf('---------------------------------------------------------------------'))
disp(sprintf('        MIDAS         GARCH        RW      Realized'))
disp(sprintf('---------------------------------------------------------------------'))
disp(sprintf('MIDAS    %g            %g     %g      %g',r(1,1:4)))
disp(sprintf('GARCH    %g     %g            %g      %g',r(2,1:4)))
disp(sprintf('RW       %g     %g         %g         %g',r(3,1:4)))
disp(sprintf('Realized %g     %g     %g         %g',r(4,1:4)))
disp('.')


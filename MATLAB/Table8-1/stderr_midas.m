%Bollerslev Wooldridge standard errors for asymmetric midas


function [stderr]=stderr_midas(kappa)
load midas


%standard error for kappa1

f_kappa1_0=loglikelihoodasyMonthly(kappa);
f_kappa1_1=loglikelihoodasyMonthly([kappa(1)+0.00001,kappa(2),kappa(3),kappa(4),kappa(5),kappa(6),kappa(7)]);
f_kappa1_2=loglikelihoodasyMonthly([kappa(1)-0.00001,kappa(2),kappa(3),kappa(4),kappa(5),kappa(6),kappa(7)]);

der2_kappa1=(f_kappa1_1-2*f_kappa1_0+f_kappa1_2)/0.00001^2;

A_kappa1=der2_kappa1;

stderr(1)=sqrt(1/abs(A_kappa1));

%standard error for kappa2
f_kappa2_0=loglikelihoodasyMonthly(kappa);
f_kappa2_1=loglikelihoodasyMonthly([kappa(1),kappa(2)+0.00001,kappa(3),kappa(4),kappa(5),kappa(6),kappa(7)]);
f_kappa2_2=loglikelihoodasyMonthly([kappa(1),kappa(2)-0.00001,kappa(3),kappa(4),kappa(5),kappa(6),kappa(7)]);


der2_kappa2=(f_kappa2_1-2*f_kappa2_0+f_kappa2_2)/0.00001^2;

A_kappa2=der2_kappa2;

stderr(2)=sqrt(1/abs(A_kappa2));


%standard error for mu
f_mu_0=loglikelihoodasyMonthly(kappa);
f_mu_1=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3)+0.001,kappa(4),kappa(5),kappa(6),kappa(7)]);
f_mu_2=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3)-0.001,kappa(4),kappa(5),kappa(6),kappa(7)]);


der2_mu=(f_mu_1-2*f_mu_0+f_mu_2)/0.001^2;

A_mu=der2_mu;

stderr(3)=sqrt(1/abs(A_mu));

%standard error for gamma
f_gamma_0=loglikelihoodasyMonthly(kappa);
f_gamma_1=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3),kappa(4)+0.001,kappa(5),kappa(6),kappa(7)]);
f_gamma_2=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3),kappa(4)-0.001,kappa(5),kappa(6),kappa(7)]);


der2_gamma=(f_gamma_1-2*f_gamma_0+f_gamma_2)/0.001^2;

A_gamma=der2_gamma;

stderr(4)=sqrt(1/abs(A_gamma));

%standard error for kappa1 negative
f_gamma_0=loglikelihoodasyMonthly(kappa);
f_gamma_1=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3),kappa(4),kappa(5)+0.00001,kappa(6),kappa(7)]);
f_gamma_2=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3),kappa(4),kappa(5)-0.00001,kappa(6),kappa(7)]);

der2_gamma=(f_gamma_1-2*f_gamma_0+f_gamma_2)/0.00001^2;

A_gamma=der2_gamma;

stderr(5)=sqrt(1/abs(A_gamma));

%standard error for kappa2 negative
f_gamma_0=loglikelihoodasyMonthly(kappa);
f_gamma_1=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3),kappa(4),kappa(5),kappa(6)+0.00001,kappa(7)]);
f_gamma_2=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3),kappa(4),kappa(5),kappa(6)-0.00001,kappa(7)]);


der2_gamma=(f_gamma_1-2*f_gamma_0+f_gamma_2)/0.00001^2;



A_gamma=der2_gamma;

stderr(6)=sqrt(1/abs(A_gamma));

%standard error for phi
f_gamma_0=loglikelihoodasyMonthly(kappa);
f_gamma_1=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3),kappa(4),kappa(5),kappa(6),kappa(7)+0.00001]);
f_gamma_2=loglikelihoodasyMonthly([kappa(1),kappa(2),kappa(3),kappa(4),kappa(5),kappa(6),kappa(7)-0.00001]);


der2_gamma=(f_gamma_1-2*f_gamma_0+f_gamma_2)/0.00001^2;



A_gamma=der2_gamma;

stderr(7)=sqrt(1/abs(A_gamma));

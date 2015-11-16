%Bollerslev Wooldridge standard errors


function [stderr]=stderr_midas_m(kappa_m)
load midas


%standard error for kappa1

f_kappa1_0=loglikelihood_m(kappa_m);
f_kappa1_1=loglikelihood_m([kappa_m(1)+0.00001,kappa_m(2),kappa_m(3),kappa_m(4)]);
f_kappa1_2=loglikelihood_m([kappa_m(1)-0.00001,kappa_m(2),kappa_m(3),kappa_m(4)]);

der1_kappa1=(f_kappa1_1-f_kappa1_0)/0.00001;
der2_kappa1=(f_kappa1_1-2*f_kappa1_0+f_kappa1_2)/0.00001^2;


B_kappa1=sum(der1_kappa1^2);
A_kappa1=der2_kappa1;

stderr(1)=sqrt(1/A_kappa1);

%standard error for kappa2
f_kappa2_0=loglikelihood_m(kappa_m);
f_kappa2_1=loglikelihood_m([kappa_m(1),kappa_m(2)+0.00001,kappa_m(3),kappa_m(4)]);
f_kappa2_2=loglikelihood_m([kappa_m(1),kappa_m(2)-0.00001,kappa_m(3),kappa_m(4)]);

der1_kappa2=(f_kappa2_1-f_kappa2_0)/0.00001;
der2_kappa2=(f_kappa2_1-2*f_kappa2_0+f_kappa2_2)/0.00001^2;

B_kappa2=sum(der1_kappa2^2);
A_kappa2=der2_kappa2;

stderr(2)=sqrt(1/A_kappa2);


%standard error for mu
f_mu_0=loglikelihood_m(kappa_m);
f_mu_1=loglikelihood_m([kappa_m(1),kappa_m(2),kappa_m(3)+0.00001,kappa_m(4)]);
f_mu_2=loglikelihood_m([kappa_m(1),kappa_m(2),kappa_m(3)-0.00001,kappa_m(4)]);

der1_mu=(f_mu_1-f_mu_0)/0.00001;
der2_mu=(f_mu_1-2*f_mu_0+f_mu_2)/0.00001^2;



score_mu=der1_mu;
B_mu=sum(score_mu^2);
A_mu=der2_mu;

stderr(3)=sqrt(1/A_mu);

%standard error for gamma
f_gamma_0=loglikelihood_m(kappa_m);
f_gamma_1=loglikelihood_m([kappa_m(1),kappa_m(2),kappa_m(3),kappa_m(4)+0.00001]);
f_gamma_2=loglikelihood_m([kappa_m(1),kappa_m(2),kappa_m(3),kappa_m(4)-0.00001]);

der1_gamma=(f_gamma_1-f_gamma_0)/0.00001;
der2_gamma=(f_gamma_1-2*f_gamma_0+f_gamma_2)/0.00001^2;



score_gamma=der1_gamma;
B_gamma=sum(score_gamma^2);
A_gamma=der2_gamma;

stderr(4)=sqrt(1/A_gamma);

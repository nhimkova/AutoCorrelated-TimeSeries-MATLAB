%Bollerslev Wooldridge standard errors


function [stderr]=stderr_rw2(para_rw)
load midas


%standard error for mu
f_mu_0=loglikelihoodRW2(para_rw);
f_mu_1=loglikelihoodRW2([para_rw(1)+0.00001,para_rw(2)]);
f_mu_2=loglikelihoodRW2([para_rw(1)-0.00001,para_rw(2)]);

der2_mu=(f_mu_1-2*f_mu_0+f_mu_2)/0.00001^2;

A_mu=der2_mu;

stderr(1)=sqrt(1/A_mu);

%standard error for gamma
f_gamma_0=loglikelihoodRW2(para_rw);
f_gamma_1=loglikelihoodRW2([para_rw(1),para_rw(2)+0.00001]);
f_gamma_2=loglikelihoodRW2([para_rw(1),para_rw(2)-0.00001]);

der2_gamma=(f_gamma_1-2*f_gamma_0+f_gamma_2)/0.00001^2;


A_gamma=der2_gamma;

stderr(2)=sqrt(1/A_gamma);


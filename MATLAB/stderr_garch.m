%Bollerslev Wooldridge standard errors for garch


function [stderr_g]=stderr_garch(para)
load midas
%para(1)=w,(2)=alpha,(3)=beta,4=mu,5=gamma

%standard error for omega

f_omega_0=loglikelihood_garch(para);
f_omega_1=loglikelihood_garch([para(1)+0.00001,para(2),para(3),para(4),para(5)]);
f_omega_2=loglikelihood_garch([para(1)-0.00001,para(2),para(3),para(4),para(5)]);

der2_omega=(f_omega_1-2*f_omega_0+f_omega_2)/0.00001^2;

A_omega=der2_omega;

stderr_g(1)=sqrt(1/abs(A_omega));

%standard error for alpha
f_alpha_0=loglikelihood_garch(para);
f_alpha_1=loglikelihood_garch([para(1),para(2)+0.00001,para(3),para(4),para(5)]);
f_alpha_2=loglikelihood_garch([para(1),para(2)-0.00001,para(3),para(4),para(5)]);

der2_alpha=(f_alpha_1-2*f_alpha_0+f_alpha_2)/0.00001^2;

A_alpha=der2_alpha;

stderr_g(2)=sqrt(1/abs(A_alpha));

%standard error for beta
f_beta_0=loglikelihood_garch(para);
f_beta_1=loglikelihood_garch([para(1),para(2),para(3)+0.00001,para(4),para(5)]);
f_beta_2=loglikelihood_garch([para(1),para(2),para(3)-0.00001,para(4),para(5)]);

der2_beta=(f_beta_1-2*f_beta_0+f_beta_2)/0.00001^2;

A_beta=der2_beta;

stderr_g(3)=sqrt(abs(1/A_beta));


%standard error for mu
f_mu_0=loglikelihood_garch(para);
f_mu_1=loglikelihood_garch([para(1),para(2),para(3),para(4)+0.00001,para(5)]);
f_mu_2=loglikelihood_garch([para(1),para(2),para(3),para(4)-0.00001,para(5)]);

der2_mu=(f_mu_1-2*f_mu_0+f_mu_2)/0.00001^2;


A_mu=der2_mu;

stderr_g(4)=sqrt(1/abs(A_mu));

%standard error for gamma
f_gamma_0=loglikelihood_garch(para);
f_gamma_1=loglikelihood_garch([para(1),para(2),para(3),para(4),para(5)+0.00001]);
f_gamma_2=loglikelihood_garch([para(1),para(2),para(3),para(4),para(5)-0.00001]);

der2_gamma=(f_gamma_1-2*f_gamma_0+f_gamma_2)/0.00001^2;


A_gamma=der2_gamma;

stderr_g(5)=sqrt(1/abs(A_gamma));


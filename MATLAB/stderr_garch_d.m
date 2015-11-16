%Bollerslev Wooldridge standard errors for garch


function [stderr_g_d]=stderr_garch_d(para_d)
load midas
%para_d(1)=w,(2)=alpha,(3)=beta,4=mu,5=gamma

%standard error for omega

f_omega_0=loglikelihood_garch_d(para_d);
f_omega_1=loglikelihood_garch_d([para_d(1)+0.00001,para_d(2),para_d(3),para_d(4),para_d(5)]);
f_omega_2=loglikelihood_garch_d([para_d(1)-0.00001,para_d(2),para_d(3),para_d(4),para_d(5)]);

der2_omega=(f_omega_1-2*f_omega_0+f_omega_2)/0.00001^2;

A_omega=der2_omega;

stderr_g_d(1)=sqrt(1/abs(A_omega));

%standard error for alpha
f_alpha_0=loglikelihood_garch_d(para_d);
f_alpha_1=loglikelihood_garch_d([para_d(1),para_d(2)+0.00001,para_d(3),para_d(4),para_d(5)]);
f_alpha_2=loglikelihood_garch_d([para_d(1),para_d(2)-0.00001,para_d(3),para_d(4),para_d(5)]);

der2_alpha=(f_alpha_1-2*f_alpha_0+f_alpha_2)/0.00001^2;

A_alpha=der2_alpha;

stderr_g_d(2)=sqrt(1/abs(A_alpha));

%standard error for beta
f_beta_0=loglikelihood_garch_d(para_d);
f_beta_1=loglikelihood_garch_d([para_d(1),para_d(2),para_d(3)+0.00001,para_d(4),para_d(5)]);
f_beta_2=loglikelihood_garch_d([para_d(1),para_d(2),para_d(3)-0.00001,para_d(4),para_d(5)]);

der2_beta=(f_beta_1-2*f_beta_0+f_beta_2)/0.00001^2;

A_beta=der2_beta;

stderr_g_d(3)=sqrt(abs(1/A_beta));


%standard error for mu
f_mu_0=loglikelihood_garch_d(para_d);
f_mu_1=loglikelihood_garch_d([para_d(1),para_d(2),para_d(3),para_d(4)+0.00001,para_d(5)]);
f_mu_2=loglikelihood_garch_d([para_d(1),para_d(2),para_d(3),para_d(4)-0.00001,para_d(5)]);

der2_mu=(f_mu_1-2*f_mu_0+f_mu_2)/0.00001^2;


A_mu=der2_mu;

stderr_g_d(4)=sqrt(1/abs(A_mu));

%standard error for gamma
f_gamma_0=loglikelihood_garch_d(para_d);
f_gamma_1=loglikelihood_garch_d([para_d(1),para_d(2),para_d(3),para_d(4),para_d(5)+0.00001]);
f_gamma_2=loglikelihood_garch_d([para_d(1),para_d(2),para_d(3),para_d(4),para_d(5)-0.00001]);

der2_gamma=(f_gamma_1-2*f_gamma_0+f_gamma_2)/0.00001^2;


A_gamma=der2_gamma;

stderr_g_d(5)=sqrt(1/abs(A_gamma));


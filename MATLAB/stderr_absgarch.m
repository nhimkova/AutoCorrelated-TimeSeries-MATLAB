%Bollerslev Wooldridge standard errors for ABSgarch


function [stderr_abs]=stderr_absgarch(paraabs)
load midas
%paraabs(1)=w,(2)=alpha,(3)=beta,4=mu,5=gamma

%standard error for omega

f_omega_0=loglikelihood_absgarch(paraabs);
f_omega_1=loglikelihood_absgarch([paraabs(1)+0.000001,paraabs(2),paraabs(3),paraabs(4),paraabs(5)]);
f_omega_2=loglikelihood_absgarch([paraabs(1)-0.000001,paraabs(2),paraabs(3),paraabs(4),paraabs(5)]);

der2_omega=(f_omega_1-2*f_omega_0+f_omega_2)/0.000001^2;

A_omega=der2_omega;

stderr_abs(1)=sqrt(1/abs(A_omega));

%standard error for alpha
f_alpha_0=loglikelihood_absgarch(paraabs);
f_alpha_1=loglikelihood_absgarch([paraabs(1),paraabs(2)+0.000001,paraabs(3),paraabs(4),paraabs(5)]);
f_alpha_2=loglikelihood_absgarch([paraabs(1),paraabs(2)-0.000001,paraabs(3),paraabs(4),paraabs(5)]);

der2_alpha=(f_alpha_1-2*f_alpha_0+f_alpha_2)/0.000001^2;

A_alpha=der2_alpha;

stderr_abs(2)=sqrt(1/abs(A_alpha));

%standard error for beta
f_beta_0=loglikelihood_absgarch(paraabs);
f_beta_1=loglikelihood_absgarch([paraabs(1),paraabs(2),paraabs(3)+0.000001,paraabs(4),paraabs(5)]);
f_beta_2=loglikelihood_absgarch([paraabs(1),paraabs(2),paraabs(3)-0.000001,paraabs(4),paraabs(5)]);

der2_beta=(f_beta_1-2*f_beta_0+f_beta_2)/0.000001^2;

A_beta=der2_beta;

stderr_abs(3)=sqrt(abs(1/A_beta));


%standard error for mu
f_mu_0=loglikelihood_absgarch(paraabs);
f_mu_1=loglikelihood_absgarch([paraabs(1),paraabs(2),paraabs(3),paraabs(4)+0.000001,paraabs(5)]);
f_mu_2=loglikelihood_absgarch([paraabs(1),paraabs(2),paraabs(3),paraabs(4)-0.000001,paraabs(5)]);

der2_mu=(f_mu_1-2*f_mu_0+f_mu_2)/0.000001^2;


A_mu=der2_mu;

stderr_abs(4)=sqrt(1/abs(A_mu));

%standard error for gamma
f_gamma_0=loglikelihood_absgarch(paraabs);
f_gamma_1=loglikelihood_absgarch([paraabs(1),paraabs(2),paraabs(3),paraabs(4),paraabs(5)+0.000001]);
f_gamma_2=loglikelihood_absgarch([paraabs(1),paraabs(2),paraabs(3),paraabs(4),paraabs(5)-0.000001]);

der2_gamma=(f_gamma_1-2*f_gamma_0+f_gamma_2)/0.000001^2;


A_gamma=der2_gamma;

stderr_abs(5)=sqrt(1/abs(A_gamma));
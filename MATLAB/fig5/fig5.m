%
%
%Fig5

x=[252:-1:1];
%symmetric weights
kappa1=[-0.005,-0.001];
y1=estiweights(kappa1);


%asymmetric weights r>0
kappa2=[0.03,-0.004,0.006,6.159,0.6,-0.13,0.05];
y2=estiweights(kappa2);

%asymmetric r<0
% use kappa(5)&(6)

y3=Nestiweights(kappa2);

%asymmetric total
psy=kappa2(7);
y4=(psy*Nestiweights(kappa2)+(1-psy)*estiweights(kappa2));

%plot(x,y1,'-',x,y2,'--',x,y3,'-.',x,y4,'k-')
plot(x,y1,'-',x,y2,'--',x,y3,'-.')
%legend('Symmetric','Positive','Negative','Asymmetric total');
legend('Symmetric','Positive','Negative');
title('MIDAS weights')
xlabel('Lag in days')
ylabel('weight')
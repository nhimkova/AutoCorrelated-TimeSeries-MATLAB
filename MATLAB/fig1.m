
subplot(1,3,1);
x=1:252;
plot(x,weight1)
legend('kappa1<0, kappa2>0')
xlabel('Days lagged')
ylabel('Weights')

subplot(1,3,2);
x=1:252;
plot(x,weight2)
legend('kappa1=0, kappa2=0')
xlabel('Days lagged')
ylabel('Weights')

subplot(1,3,3);
x=1:252;
plot(x,weight3)
legend('kappa1<0, kappa2<0')
xlabel('Days lagged')
ylabel('Weights')